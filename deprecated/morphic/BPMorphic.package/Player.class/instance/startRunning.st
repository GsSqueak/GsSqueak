scripts-execution
startRunning
	self costume arrangeToStartStepping.
	self
		instantiatedUserScriptsDo: [:aScript | aScript startRunningIfPaused]