keystroke helpers
stepIntoSubmenu: evt

	(selectedItem notNil and: [ selectedItem hasSubMenu ]) ifTrue: [
		evt hand newMouseFocus: selectedItem subMenu.
		evt hand newKeyboardFocus: selectedItem subMenu.
		selectedItem subMenu moveSelectionDown: 1 event: evt.
		^true ].
	^false