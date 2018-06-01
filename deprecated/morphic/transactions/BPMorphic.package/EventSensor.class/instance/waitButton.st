mouse
waitButton
	"Wait for the user to press any mouse button and then answer with
	the 
	current location of the cursor."
	| _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 50.
	[self anyButtonPressed]
		whileFalse: [_gsSqueakTemp_delay wait].
	^ self cursorPoint