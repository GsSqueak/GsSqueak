allocation
growObjectMemory: delta 
	"Attempt to grow the object memory by the given delta 
	amount "
	| limit |
	<var: #delta type: 'usqInt'>
	<var: #limit type: 'usqInt'>
	(self isExcessiveAllocationRequest: delta shift: 0) ifFalse: [
		statGrowMemory := statGrowMemory + 1.
		limit := self sqGrowMemory: memoryLimit By: delta.
		limit = memoryLimit
			ifFalse: [memoryLimit := limit - 24.
				"remove a tad for safety"
				self initializeMemoryFirstFree: freeBlock]]