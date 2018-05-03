object memory support
postGCAction
	"Mark the active and home contexts as roots if old. This 
	allows the interpreter to use storePointerUnchecked to 
	store into them."

	compilerInitialized
		ifTrue: [self compilerPostGC]
		ifFalse: [(objectMemory oop: activeContext isLessThan: objectMemory getYoungStart)
				ifTrue: [objectMemory beRootIfOld: activeContext].
			(objectMemory oop: theHomeContext isLessThan: objectMemory getYoungStart)
				ifTrue: [objectMemory beRootIfOld: theHomeContext]].
	(objectMemory oop: (objectMemory sizeOfFree: objectMemory getFreeBlock) isGreaterThan:  objectMemory getShrinkThreshold)
		ifTrue: ["Attempt to shrink memory after successfully 
			reclaiming lots of memory"
			objectMemory shrinkObjectMemory: (objectMemory sizeOfFree: objectMemory getFreeBlock) - objectMemory getGrowHeadroom].
	
	self signalSemaphoreWithIndex: objectMemory getGcSemaphoreIndex.
