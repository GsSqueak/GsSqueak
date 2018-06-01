as yet unclassified
initialize
	super initialize.
	self extent: self defaultWidth+2 @ (self defaultHeight+2).
	self layoutFrame: self gripLayoutFrame