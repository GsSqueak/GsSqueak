-Etoys-scripting
restoreTypeColor
	self player
		ifNotNil: [self player allScriptEditors
				do: [:anEditor | anEditor
						allMorphsDo: [:m | m restoreTypeColor]]]