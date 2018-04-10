-Etoys-scripting
isTileScriptingElement
	^ self hasButtonProperties
		and: [self buttonProperties isTileScriptingElement]