drawing
clipSubmorphs: aBool 
	"Drawing specific. If this property is set, clip the receiver's submorphs
	to the receiver's clipping bounds."
	self invalidRect: self fullBounds.
	aBool == false
		ifTrue: [self removeProperty: #clipSubmorphs]
		ifFalse: [self setProperty: #clipSubmorphs toValue: aBool].
	self invalidRect: self fullBounds