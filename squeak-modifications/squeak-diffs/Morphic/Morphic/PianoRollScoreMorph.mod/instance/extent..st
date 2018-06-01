geometry
extent: aPoint
	"Force rebuild when re-sized."

	super extent: aPoint. 
	score ifNotNil: [self updateLowestNote].
	self rebuildFromScore.
