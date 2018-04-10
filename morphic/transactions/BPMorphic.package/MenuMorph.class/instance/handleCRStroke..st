keystroke helpers
handleCRStroke: evt 
	| _gsSqueakTemp_selectable |
	evt keyValue = 13
		ifFalse: [^ false].
	selectedItem
		ifNotNil: [selectedItem hasSubMenu
				ifTrue: [evt hand newMouseFocus: selectedItem subMenu;
						 newKeyboardFocus: selectedItem subMenu]
				ifFalse: [selectedItem invokeWithEvent: evt].
			^ true].
	(_gsSqueakTemp_selectable := self items) size = 1
		ifTrue: [_gsSqueakTemp_selectable first invokeWithEvent: evt].
	^ true