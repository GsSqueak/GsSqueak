event handling
mouseEnter: event 
	"Restore the selection in the text morph if there was a selection."
	super mouseEnter: event.
	selectionInterval
		ifNotNil: [:interval | textMorph editor selectInterval: selectionInterval;
				 setEmphasisHere].
	Preferences mouseOverForKeyboardFocus
		ifTrue: [event hand newKeyboardFocus: self]