modal dialogs
modalFileSelectorForSuffixes: aList

	| window aFileList |

	window := self morphicViewFileSelectorForSuffixes: aList.
	aFileList := window valueOfProperty: #fileListModel.
	aFileList resort: #name.
	window openCenteredInWorld.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^aFileList getSelectedFile