misc
updateStatusForAllScriptEditors
	self allScriptEditors
		do: [:anEditor | anEditor updateStatus]