mouse
waitNoButton
	"Wait for the user to release any mouse button and then answer the
	current location of the cursor."
	| _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 50.
	[self anyButtonPressed]
		whileTrue: [_gsSqueakTemp_delay wait].
	^ self cursorPoint