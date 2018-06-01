event handling
handlesMouseDown: evt 
	^ (evt shiftPressed
			and: [self wantsKeyboardFocusOnShiftClick])
		or: [super handlesMouseDown: evt]