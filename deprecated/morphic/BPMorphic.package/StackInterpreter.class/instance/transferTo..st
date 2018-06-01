process primitive support
transferTo: newProc 
	"Record a process to be awoken on the next interpreter cycle."
	| _gsSqueakTemp_activeContext _gsSqueakTemp_sched _gsSqueakTemp_oldProc |
	statProcessSwitch := statProcessSwitch + 1.
	self push: instructionPointer.
	self externalWriteBackHeadFramePointers.
	self
		assertValidExecutionPointe: instructionPointer + 1
		r: framePointer
		s: stackPointer.
	_gsSqueakTemp_sched := self schedulerPointer.
	_gsSqueakTemp_oldProc := objectMemory fetchPointer: ActiveProcessIndex ofObject: _gsSqueakTemp_sched.
	_gsSqueakTemp_activeContext := self ensureFrameIsMarried: framePointer SP: stackPointer + objectMemory wordSize.
	objectMemory
		storePointer: SuspendedContextIndex
		ofObject: _gsSqueakTemp_oldProc
		withValue: _gsSqueakTemp_activeContext.
	objectMemory
		storePointer: ActiveProcessIndex
		ofObject: _gsSqueakTemp_sched
		withValue: newProc.
	objectMemory
		storePointerUnchecked: MyListIndex
		ofObject: newProc
		withValue: objectMemory nilObject.
	self externalSetStackPageAndPointersForSuspendedContextOfProcess: newProc