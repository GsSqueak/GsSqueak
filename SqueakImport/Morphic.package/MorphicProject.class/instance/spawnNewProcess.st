active process
spawnNewProcess

	uiProcess := [
		[world doOneCycle.  Processor yield ] repeat.
	] newProcess priority: Processor userSchedulingPriority.
	uiProcess resume