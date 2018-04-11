scripts-kernel
allScriptEditors
	"Used presently only an one-shot efforts to update all tile scripts to
	new styles"
	^ self class tileScriptNames
		collect: [:n | self scriptEditorFor: n]