events
mouseLeave: event 
	super mouseLeave: event.
	self hoverRow: nil.
	Preferences mouseOverForKeyboardFocus
		ifTrue: [event hand releaseKeyboardFocus: self]