geometry
scrollDeltaHeight
	^ scroller hasSubmorphs
		ifTrue: [scroller firstSubmorph height]
		ifFalse: [super scrollDeltaHeight]