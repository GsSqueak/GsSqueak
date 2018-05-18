keyboard control
selectCurrentItem: evt 
	| selectable |
	selectedItem ifNotNil: 
			[selectedItem hasSubMenu 
				ifTrue: [self selectSubMenu: evt]
				ifFalse: [selectedItem invokeWithEvent: evt]].
	(selectable := self items) size = 1 
		ifTrue: [selectable first invokeWithEvent: evt]