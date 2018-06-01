scripts-execution
prepareToBeRunning
	self
		instantiatedUserScriptsDo: [:aScriptInstantiation | aScriptInstantiation prepareToBeRunning]