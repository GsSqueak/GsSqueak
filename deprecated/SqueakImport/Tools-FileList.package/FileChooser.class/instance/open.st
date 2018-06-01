open
open
	| model |
	self postOpen. "Funny name in this context, should be renamed, but whatever..."
	self morphicView openInWorld.
	UserInterfaceTheme current applyTo: self morphicView allMorphs.
	model := self morphicView model.
	FileChooser modalLoopOn: self morphicView.
	^ model getSelectedFile.
