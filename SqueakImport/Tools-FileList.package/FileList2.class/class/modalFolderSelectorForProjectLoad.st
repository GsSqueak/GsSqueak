modal dialogs
modalFolderSelectorForProjectLoad

	| window fileModel w |

	window := self morphicViewProjectLoader2InWorld: self currentWorld reallyLoad: false.
	fileModel := window valueOfProperty: #FileList.
	w := self currentWorld.
	window position: w topLeft + (w extent - window extent // 2).
	window openInWorld: w.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^fileModel getSelectedDirectory withoutListWrapper