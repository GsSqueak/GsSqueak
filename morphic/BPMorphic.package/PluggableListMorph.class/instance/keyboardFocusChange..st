event handling
keyboardFocusChange: aBoolean 
	"The message is sent to a morph when its keyboard focus changes.
	The given argument indicates that the receiver is gaining (versus
	losing) the keyboard focus.
	In this case, all we need to do is to redraw border feedback"
	aBoolean
		ifFalse: [self hoverRow: nil.
			self clearFilterAutomatically
				ifTrue: [self hasFilter
						ifTrue: [self removeFilter; updateList]]].
	super keyboardFocusChange: aBoolean