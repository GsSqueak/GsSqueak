scheduling
newProcessWith: anArray 
	"Answer a Process running the code in the receiver. The receiver's block 
	arguments are bound to the contents of the argument, anArray. The 
	process is not scheduled."
	<primitive: 19> "Simulation guard"
	^Process
		forContext: 
			[self valueWithArguments: anArray.
			"Since control is now at the bottom there is no need to terminate (which
			 runs unwinds) since all unwnds have been run.  Simply suspend.
			 Note that we must use this form rather than e.g. Processor suspendActive
			 so that isTerminated answers true.  isTerminated requires that if there is a
			 suspended context it is the bottom-most, but using a send would result in
			 the process's suspendedContext /not/ being the bottom-most."
			Processor activeProcess suspend] asContext
		priority: Processor activePriority