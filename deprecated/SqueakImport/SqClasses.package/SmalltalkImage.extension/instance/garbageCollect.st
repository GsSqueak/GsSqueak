*SqClasses-*SqClasses-*SqClasses-memory space
garbageCollect
	"Reclaims all garbage and answers the number of bytes of available space in the largest free chunk."
	Object flushDependents.
	EventManager flushEvents.
	^self primitiveGarbageCollect
