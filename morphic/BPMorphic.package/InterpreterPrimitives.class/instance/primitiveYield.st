process primitives
primitiveYield
	"Primitively do the equivalent of Process>yield, avoiding the overhead
	of a fork and a wait in the standard implementation."
	| _gsSqueakTemp_scheduler _gsSqueakTemp_activeProc _gsSqueakTemp_priority _gsSqueakTemp_processLists _gsSqueakTemp_processList |
	_gsSqueakTemp_scheduler := self schedulerPointer.
	_gsSqueakTemp_activeProc := objectMemory fetchPointer: ActiveProcessIndex ofObject: _gsSqueakTemp_scheduler.
	_gsSqueakTemp_priority := self quickFetchInteger: PriorityIndex ofObject: _gsSqueakTemp_activeProc.
	_gsSqueakTemp_processLists := objectMemory fetchPointer: ProcessListsIndex ofObject: _gsSqueakTemp_scheduler.
	_gsSqueakTemp_processList := objectMemory fetchPointer: _gsSqueakTemp_priority - 1 ofObject: _gsSqueakTemp_processLists.
	(self isEmptyList: _gsSqueakTemp_processList)
		ifFalse: [self addLastLink: _gsSqueakTemp_activeProc toList: _gsSqueakTemp_processList.
			self transferTo: self wakeHighestPriority]