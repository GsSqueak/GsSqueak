initialization
addCornerGrips
	"When enabled via preference, also add edge grips"
	super addCornerGrips.
	self class resizeAlongEdges
		ifTrue: [self addEdgeGrips]