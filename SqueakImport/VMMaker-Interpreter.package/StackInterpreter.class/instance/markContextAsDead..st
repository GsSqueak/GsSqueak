frame access
markContextAsDead: oop
	"Mark the argument, which must be a context, married, widowed or single, as dead.
	 For married or widowed contexts this breaks any link to the spouse and makes the context single.
	 For all contexts, marks the comtext as inactive/having been returned from."
	<inline: true>
	self assert: (self isContext: oop).
	objectMemory
		storePointerUnchecked: SenderIndex ofObject: oop withValue: objectMemory nilObject;
		storePointerUnchecked: InstructionPointerIndex ofObject: oop withValue: objectMemory nilObject