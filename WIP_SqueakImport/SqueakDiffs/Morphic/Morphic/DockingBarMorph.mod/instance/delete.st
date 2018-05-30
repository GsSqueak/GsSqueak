submorphs-add/remove
delete

	ActiveHand removeKeyboardListener: self.
	activeSubMenu
		ifNotNil: [activeSubMenu delete].
	^ super delete