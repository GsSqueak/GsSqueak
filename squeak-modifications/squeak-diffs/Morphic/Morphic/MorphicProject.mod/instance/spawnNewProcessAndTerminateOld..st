active process
spawnNewProcessAndTerminateOld: terminate

	self spawnNewProcess.
	terminate
		ifTrue: [Processor terminateActive]
		ifFalse: [Processor activeProcess suspend]