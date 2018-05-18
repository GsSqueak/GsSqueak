modal dialogs
modalFileSelectorForSuffixes: aList directory: aDirectory

	| window aFileList |

	window := self morphicViewFileSelectorForSuffixes: aList directory: aDirectory.
	aFileList := window valueOfProperty: #fileListModel.
	window openCenteredInWorld.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^aFileList getSelectedFile