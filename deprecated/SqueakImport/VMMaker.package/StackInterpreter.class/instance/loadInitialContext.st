initialization
loadInitialContext
	| activeProc activeContext |
	objectMemory leakCheckFullGC ifTrue:
		[objectMemory clearLeakMapAndMapAccessibleObjects.
		 self assert: objectMemory checkHeapIntegrity].
	activeProc := self activeProcess.
	activeContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: activeProc.
	self marryContextInNewStackPageAndInitializeInterpreterRegisters: activeContext