process primitive support
transferTo: aProc 
	"Record a process to be awoken on the next interpreter cycle. 
	ikp 11/24/1999 06:07 -- added hook for external runtime 
	compiler "
	| sched oldProc newProc |
	newProc := aProc.
	sched := self schedulerPointer.
	oldProc := objectMemory fetchPointer: ActiveProcessIndex ofObject: sched.
	objectMemory storePointer: ActiveProcessIndex ofObject: sched withValue: newProc.
	compilerInitialized
		ifTrue: [self compilerProcessChange: oldProc to: newProc]
		ifFalse: [objectMemory storePointer: SuspendedContextIndex ofObject: oldProc withValue: activeContext.
			self newActiveContext: (objectMemory fetchPointer: SuspendedContextIndex ofObject: newProc).
			objectMemory storePointer: SuspendedContextIndex ofObject: newProc withValue: objectMemory getNilObj].
	reclaimableContextCount := 0