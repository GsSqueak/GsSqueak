geometry
resizeScroller
	"Also needs to resize the text morph"

	super resizeScroller.

	textMorph ifNotNil: [:tm |
		tm isWrapped ifTrue: [textMorph extent: self scroller extent]].