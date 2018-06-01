control
popUpAt: aPoint forHand: hand in: aWorld allowKeyboard: aBoolean 
	"Present this menu at the given point under control of the given 
	hand."
	| _gsSqueakTemp_evt |
	aWorld submorphs
		select: [:each | (each isKindOf: MenuMorph)
				and: [each stayUp not]]
		thenCollect: [:menu | menu delete].
	self items isEmpty
		ifTrue: [^ self].
	MenuIcons decorateMenu: self.
	(self submorphs
		select: [:m | m isKindOf: UpdatingMenuItemMorph])
		do: [:m | m updateContents].
	"precompute width"
	self
		positionAt: aPoint
		relativeTo: (selectedItem
				ifNil: [self items first])
		inWorld: aWorld.
	aWorld addMorphFront: self.
	"Acquire focus for valid pop up behavior"
	hand newMouseFocus: self.
	aBoolean
		ifTrue: [originalFocusHolder := hand keyboardFocus.
			hand newKeyboardFocus: self.
			self showKeyboardHelp].
	_gsSqueakTemp_evt := hand lastEvent.
	(_gsSqueakTemp_evt isKeyboard
			or: [_gsSqueakTemp_evt isMouse
					and: [_gsSqueakTemp_evt anyButtonPressed not]])
		ifTrue: ["Select first item if button not down"
			self moveSelectionDown: 1 event: _gsSqueakTemp_evt
			"Select first item if button not down"].
	self updateColor.
	self changed