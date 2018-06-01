as yet unclassified
objectSize
	"Single stepping through a debugger might observe the state of an OrderedCollection 
	instance after creation by basicNew but before initiialisation.  Thus 'object size' 
	throws a DNU error for arithmetic on a nil value that needs to be handled here." 

	^ [ object size ] on: Error do: [ 0 ]
