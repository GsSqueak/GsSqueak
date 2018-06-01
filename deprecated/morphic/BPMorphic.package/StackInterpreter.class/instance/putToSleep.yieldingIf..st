process primitive support
putToSleep: aProcess yieldingIf: yieldImplicitly 
	"Save the given process on the scheduler process list for its priority,
	adding to the back if yieldImplicitly or to the front if not
	yieldImplicitly. "
	| _gsSqueakTemp_priority _gsSqueakTemp_processLists _gsSqueakTemp_processList |
	self assert: framePointer - stackPointer < (LargeContextSlots * objectMemory bytesPerOop).
	_gsSqueakTemp_priority := self quickFetchInteger: PriorityIndex ofObject: aProcess.
	(highestRunnableProcessPriority ~= 0
			and: [_gsSqueakTemp_priority > highestRunnableProcessPriority])
		ifTrue: [highestRunnableProcessPriority := _gsSqueakTemp_priority].
	_gsSqueakTemp_processLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	_gsSqueakTemp_processList := objectMemory fetchPointer: _gsSqueakTemp_priority - 1 ofObject: _gsSqueakTemp_processLists.
	yieldImplicitly
		ifTrue: [self addLastLink: aProcess toList: _gsSqueakTemp_processList]
		ifFalse: [self addFirstLink: aProcess toList: _gsSqueakTemp_processList]