event handling
hasKeyboardFocus

	^ self activeHand
		ifNil: [false]
		ifNotNil: [:hand | self hasKeyboardFocus: hand]