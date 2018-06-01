-Etoys-scripting
useUniformTileColor
	self player
		ifNotNil: [self player allScriptEditors
				do: [:anEditor | anEditor
						allMorphsDo: [:m | m useUniformTileColor]]]