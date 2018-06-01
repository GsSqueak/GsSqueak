vm parameters
maxExternalSemaphores: aSize
	"Changes the size of table where external semaphores are registered. 
	The size can only grow, and will always be the next power of two larger than the parameter.
	
	Setting this at any time other than start-up can potentially lose requests.
	 i.e. during the realloc new storage is allocated,
	the old contents are copied and then pointers are switched. 
	 Requests occurring during copying won't be seen if they occur to indices already copied. 
	The intended use is to set the table to some adequate maximum at start-up"
	
	self isRunningCog ifFalse: [^0].
	"The vm-header field is a short, maximum 64k entries. Well, on most platforms anyways "
	(aSize < 0 or: [aSize > 16rFFFF]) ifTrue: [^self error: 'maxExternalSemaphores: is limited to 16rFFFF'].
	^self vmParameterAt: 49 put: aSize
