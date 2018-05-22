modal dialogs
modalFolderSelector: aDir

	| window fileModel |
	window := self morphicViewFolderSelector: aDir.
	fileModel := window model.
	window openInWorld: self currentWorld extent: 300@400.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^fileModel getSelectedDirectory withoutListWrapper