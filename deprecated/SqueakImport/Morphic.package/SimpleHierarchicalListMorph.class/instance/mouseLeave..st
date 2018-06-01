event handling
mouseLeave: aMouseEvent 

	super mouseLeave: aMouseEvent.
	self hoveredMorph: nil.
	
	Preferences mouseOverForKeyboardFocus
		ifTrue: [aMouseEvent hand releaseKeyboardFocus: self].