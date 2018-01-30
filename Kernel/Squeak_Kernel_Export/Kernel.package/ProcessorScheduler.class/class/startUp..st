background process
startUp: resuming
	"Install a background process of the lowest possible priority that is always runnable."
	"Details: The virtual machine requires that there is aways some runnable process that
	 can be scheduled; this background process ensures that this is the case."

	Smalltalk processPreemptionYields ifTrue:
		[Smalltalk processPreemptionYields: false].
	resuming ifTrue:
		[Smalltalk installLowSpaceWatcher.
		 BackgroundProcess ifNotNil:
			[BackgroundProcess terminate].
		 (BackgroundProcess := [self idleProcess] newProcess)
			priority: SystemRockBottomPriority;
			resume]