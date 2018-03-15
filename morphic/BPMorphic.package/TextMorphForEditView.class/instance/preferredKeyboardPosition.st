event handling
preferredKeyboardPosition
	| _gsSqueakTemp_pos |
	_gsSqueakTemp_pos := super preferredKeyboardPosition.
	^ _gsSqueakTemp_pos + self boundsInWorld topLeft