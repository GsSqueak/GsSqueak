event handling
wantsKeyboardFocusFor: aSubmorph 
	aSubmorph inPartsBin
		ifTrue: [^ false].
	aSubmorph wouldAcceptKeyboardFocus
		ifTrue: [^ true].
	^ super wantsKeyboardFocusFor: aSubmorph