geometry
scrollDeltaHeight
	"Return the increment in pixels which this pane should be scrolled."
	^ textMorph ifNil: [super scrollDeltaHeight] ifNotNil: [:tm | tm defaultLineHeight]
