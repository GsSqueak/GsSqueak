layout
doLayoutIn: layoutBounds
	"layout has changed. update scroll deltas or whatever else"

	self adjustPasteUpSize.
	scroller ifNotNil: [self setScrollDeltas].
	super doLayoutIn: layoutBounds.
