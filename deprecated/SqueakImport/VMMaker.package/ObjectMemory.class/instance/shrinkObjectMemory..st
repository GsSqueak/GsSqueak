allocation
shrinkObjectMemory: delta 
	"Attempt to shrink the object memory by the given delta 
	amount "
	| limit |
	statShrinkMemory := statShrinkMemory + 1. 
	limit := self sqShrinkMemory: memoryLimit By: delta.
	limit = memoryLimit
		ifFalse: [memoryLimit := limit - 24.
			"remove a tad for safety"
			self initializeMemoryFirstFree: freeBlock]