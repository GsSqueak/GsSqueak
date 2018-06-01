scripts-execution
assureNoScriptOtherThan: aScriptInstantiation hasStatus: aStatus 
	self
		instantiatedUserScriptsDo: [:aScriptInst | aScriptInst == aScriptInstantiation
				ifFalse: [aScriptInst resetToNormalIfCurrently: aStatus]]