initialization
loadInitialContext

	| sched proc |
	sched := objectMemory fetchPointer: ValueIndex ofObject: (objectMemory splObj: SchedulerAssociation).
	proc := objectMemory fetchPointer: ActiveProcessIndex ofObject: sched.
	activeContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: proc.
	(objectMemory oop: activeContext isLessThan: objectMemory getYoungStart) ifTrue: [ objectMemory beRootIfOld: activeContext ].
	self fetchContextRegisters: activeContext.
	reclaimableContextCount := 0.