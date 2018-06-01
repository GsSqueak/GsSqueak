accessing
selectedButton: aButton

	aButton
		ifNil: [self deselectButton: self selectedButton]
		ifNotNil: [self selectButton: aButton].