process primitive support
highestPriorityProcess
	"Answer the highest priority process that is ready to run, but
	unlike wakeHighestPriority do not remove it from the list.
	To save time looking at many empty lists before finding a
	runnable process the VM maintains a variable holding the
	highest priority runnable process. If this variable is 0 then the
	VM does not know the highest priority and must search all lists.
	Note: It is a fatal VM error if there is no runnable process."
	| _gsSqueakTemp_schedLists _gsSqueakTemp_p _gsSqueakTemp_processList _gsSqueakTemp_processOrNil |
	_gsSqueakTemp_schedLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	_gsSqueakTemp_p := highestRunnableProcessPriority = 0
				ifTrue: [objectMemory numSlotsOf: _gsSqueakTemp_schedLists]
				ifFalse: [highestRunnableProcessPriority].
	_gsSqueakTemp_p := _gsSqueakTemp_p - 1.
	"index of last indexable field"
	[_gsSqueakTemp_processList := objectMemory fetchPointer: _gsSqueakTemp_p ofObject: _gsSqueakTemp_schedLists.
	_gsSqueakTemp_processOrNil := objectMemory fetchPointer: FirstLinkIndex ofObject: _gsSqueakTemp_processList.
	_gsSqueakTemp_processOrNil = objectMemory nilObject]
		whileTrue: [(_gsSqueakTemp_p := _gsSqueakTemp_p - 1) < 0
				ifTrue: [^ nil]].
	highestRunnableProcessPriority := _gsSqueakTemp_p + 1.
	^ _gsSqueakTemp_processOrNil