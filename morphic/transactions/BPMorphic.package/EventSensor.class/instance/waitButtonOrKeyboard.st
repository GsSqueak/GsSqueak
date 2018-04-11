mouse
waitButtonOrKeyboard
	"Wait for the user to press either any mouse button or any key. 
	Answer the current cursor location or nil if a keypress occured."
	| _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 50.
	[self anyButtonPressed]
		whileFalse: [_gsSqueakTemp_delay wait.
			self keyboardPressed
				ifTrue: [^ nil]].
	^ self cursorPoint