*SqClasses-*SqClasses-*SqClasses-memory space
bytesLeft
	"Answer the number of bytes of space available. Does a full garbage collection."

	self garbageCollect.
	^self bytesLeft: true
