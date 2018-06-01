event handling
mouseLeave: event 
	"Save the selection interval for later."
	selectionInterval := textMorph editor selectionInterval.
	super mouseLeave: event.
	Preferences mouseOverForKeyboardFocus
		ifTrue: [event hand releaseKeyboardFocus: self]