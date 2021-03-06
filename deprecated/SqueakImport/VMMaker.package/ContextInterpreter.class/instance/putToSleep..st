process primitive support
putToSleep: aProcess
	"Save the given process on the scheduler process list for its priority."

	| priority processLists processList |
	priority := self quickFetchInteger: PriorityIndex ofObject: aProcess.
	processLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	processList := objectMemory fetchPointer: priority - 1 ofObject: processLists.
	self addLastLink: aProcess toList: processList.