event handling
mouseDown: evt
	"If the shift key is pressed, make this string the keyboard input focus."

	(evt shiftPressed and: [self wantsKeyboardFocusOnShiftClick])
		ifTrue: [self launchMiniEditor: evt]
		ifFalse: [super mouseDown: evt].
