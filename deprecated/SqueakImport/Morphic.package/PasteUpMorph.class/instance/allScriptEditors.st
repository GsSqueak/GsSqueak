misc
allScriptEditors
	^ self allMorphs select:
		[:s | s isScriptEditorMorph]