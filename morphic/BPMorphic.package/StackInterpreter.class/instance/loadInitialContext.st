initialization
loadInitialContext
	| _gsSqueakTemp_activeProc _gsSqueakTemp_activeContext |
	self
		cCode: []
		inSmalltalk: [self initExtensions].
	objectMemory runLeakCheckerFor: GCModeFull.
	_gsSqueakTemp_activeProc := self activeProcess.
	_gsSqueakTemp_activeContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: _gsSqueakTemp_activeProc.
	self marryContextInNewStackPageAndInitializeInterpreterRegisters: _gsSqueakTemp_activeContext