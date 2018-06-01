-widgets-events
grabKeyboard
	self hasKeyboard
		ifTrue: [^ self].
	self activeHand newKeyboardFocus: self