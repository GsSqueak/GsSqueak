event handling
handlesMouseDown: evt
	^ (evt shiftPressed and: [self wantsKeyboardFocusOnShiftClick])
		ifTrue: [true]
		ifFalse: [super handlesMouseDown: evt].
