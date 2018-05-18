modal dialogs
modalFileSelector

	| window |

	window := self morphicViewFileSelector.
	window openCenteredInWorld.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^(window valueOfProperty: #fileListModel) getSelectedFile