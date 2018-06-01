keyboard control
selectCurrentItem: evt 
	| _gsSqueakTemp_selectable |
	selectedItem
		ifNotNil: [selectedItem hasSubMenu
				ifTrue: [self selectSubMenu: evt]
				ifFalse: [selectedItem invokeWithEvent: evt]].
	(_gsSqueakTemp_selectable := self items) size = 1
		ifTrue: [_gsSqueakTemp_selectable first invokeWithEvent: evt]