scripts
removeScriptNamed: aScriptName 
	aScriptName
		ifNotNil: [scripts removeKey: aScriptName.
			self removeSelectorSilently: aScriptName]