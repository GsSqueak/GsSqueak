process primitive support
wakeHighestPriority
	"Return the highest priority process that is ready to run.
	To save time looking at many empty lists before finding a
	runnable process the VM maintains a variable holding the
	highest priority runnable process. If this variable is 0 then the
	VM does not know the highest priority and must search all lists.
	Note: It is a fatal VM error if there is no runnable process."
	| _gsSqueakTemp_schedLists _gsSqueakTemp_p _gsSqueakTemp_processList _gsSqueakTemp_proc _gsSqueakTemp_ctxt |
	self externalWriteBackHeadFramePointers.
	_gsSqueakTemp_schedLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	_gsSqueakTemp_p := highestRunnableProcessPriority = 0
				ifTrue: [objectMemory numSlotsOf: _gsSqueakTemp_schedLists]
				ifFalse: [highestRunnableProcessPriority].
	[(_gsSqueakTemp_p := _gsSqueakTemp_p - 1) >= 0]
		whileTrue: [_gsSqueakTemp_processList := objectMemory fetchPointer: _gsSqueakTemp_p ofObject: _gsSqueakTemp_schedLists.
			[self isEmptyList: _gsSqueakTemp_processList]
				whileFalse: ["Only answer processes with a runnable
					suspendedContext. Discard those that aren't; the VM
					would crash otherwise."
					_gsSqueakTemp_proc := self removeFirstLinkOfList: _gsSqueakTemp_processList.
					_gsSqueakTemp_ctxt := objectMemory fetchPointer: SuspendedContextIndex ofObject: _gsSqueakTemp_proc.
					(self isLiveContext: _gsSqueakTemp_ctxt)
						ifTrue: [highestRunnableProcessPriority := _gsSqueakTemp_p + 1.
							^ _gsSqueakTemp_proc].
					self warning: 'evicted zombie process from run queue']].
	self error: 'scheduler could not find a runnable process'.
	^ nil