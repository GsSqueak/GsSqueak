system attributes
processPreemptionYields: aBoolean
	"The Cog VM can be instructed not to yield on process preemption,
	 i.e. not to put a preempted process at the back of its run queue.  By
	 default preempting a process causes it to yield (Blue Book semantics)
	 which can have unfortunate effects.
	 This flag persists across snapshots, stored in the image header."

	[self vmParameterAt: 48 put: ((self vmParameterAt: 48) bitClear: 4) + (aBoolean ifTrue: [0] ifFalse: [4])]
		on: Error
		do: ["no VM parameter 48, do nothing"]
