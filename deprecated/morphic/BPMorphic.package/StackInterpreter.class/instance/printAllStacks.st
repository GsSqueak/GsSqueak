debug printing
printAllStacks
	"Print all the stacks of all running processes, including those that are
	currently suspended."
	| _gsSqueakTemp_proc _gsSqueakTemp_semaphoreClass _gsSqueakTemp_mutexClass _gsSqueakTemp_schedLists _gsSqueakTemp_p _gsSqueakTemp_processList |
	_gsSqueakTemp_proc := self activeProcess.
	self
		printNameOfClass: (objectMemory fetchClassOf: _gsSqueakTemp_proc)
		count: 5;
		 space;
		 printHex: _gsSqueakTemp_proc.
	self print: ' priority ';
		
		printNum: (self quickFetchInteger: PriorityIndex ofObject: _gsSqueakTemp_proc);
		 cr.
	self printCallStackFP: framePointer.
	"first the current activation"
	_gsSqueakTemp_schedLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	"then the runnable processes"
	_gsSqueakTemp_p := highestRunnableProcessPriority = 0
				ifTrue: [objectMemory numSlotsOf: _gsSqueakTemp_schedLists]
				ifFalse: [highestRunnableProcessPriority].
	_gsSqueakTemp_p - 1
		to: 0
		by: -1
		do: [:pri | 
			_gsSqueakTemp_processList := objectMemory fetchPointer: pri ofObject: _gsSqueakTemp_schedLists.
			(self isEmptyList: _gsSqueakTemp_processList)
				ifFalse: [self cr; print: 'processes at priority '; printNum: pri + 1.
					self printProcsOnList: _gsSqueakTemp_processList]].
	self cr; print: 'suspended processes'.
	_gsSqueakTemp_semaphoreClass := objectMemory classSemaphore.
	_gsSqueakTemp_mutexClass := objectMemory classMutex.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_semaphoreClass := objectMemory compactIndexOfClass: _gsSqueakTemp_semaphoreClass.
			_gsSqueakTemp_mutexClass := objectMemory compactIndexOfClass: _gsSqueakTemp_mutexClass.
			objectMemory
				allHeapEntitiesDo: [:obj | 
					| classIdx |
					classIdx := objectMemory classIndexOf: obj.
					(classIdx = _gsSqueakTemp_semaphoreClass
							or: [classIdx = _gsSqueakTemp_mutexClass])
						ifTrue: [self printProcsOnList: obj]]]
		ifFalse: [objectMemory
				allObjectsDoSafely: [:obj | 
					| classObj |
					classObj := objectMemory fetchClassOfNonImm: obj.
					(classObj = _gsSqueakTemp_semaphoreClass
							or: [classObj = _gsSqueakTemp_mutexClass])
						ifTrue: [self printProcsOnList: obj]]]