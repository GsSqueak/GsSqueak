keystroke helpers
handleCRStroke: evt

	| selectable |
	evt keyValue = 13 ifFalse: [ ^false ].
	selectedItem ifNotNil: [
		selectedItem hasSubMenu 
			ifTrue: [
				evt hand 
					newMouseFocus: selectedItem subMenu;
					newKeyboardFocus: selectedItem subMenu ]
			ifFalse:  [
				selectedItem invokeWithEvent: evt ].
		^true ].
	(selectable := self items) size = 1 ifTrue: [ 
		selectable first invokeWithEvent: evt ].
	^true