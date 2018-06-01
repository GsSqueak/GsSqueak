accessing
borderWidth: anInteger
	"Grow outwards preserving innerBounds"
	| c |  
	c := self center.
	super borderWidth: anInteger.
	super extent: self defaultExtent.
	self center: c.