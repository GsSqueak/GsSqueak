event handling
preferredKeyboardPosition

	| pos |
	pos := super preferredKeyboardPosition.
	^ pos + (self boundsInWorld) topLeft.
