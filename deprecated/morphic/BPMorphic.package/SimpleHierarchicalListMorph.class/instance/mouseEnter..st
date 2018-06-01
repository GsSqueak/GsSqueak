event handling
mouseEnter: event 
	super mouseEnter: event.
	Preferences mouseOverForKeyboardFocus
		ifTrue: [event hand newKeyboardFocus: self]