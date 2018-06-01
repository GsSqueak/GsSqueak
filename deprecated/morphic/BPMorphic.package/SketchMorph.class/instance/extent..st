geometry
extent: newExtent 
	"Change my scale to fit myself into the given extent.
	Avoid extents where X or Y is zero."
	newExtent isZero
		ifTrue: [^ self].
	self extent = newExtent
		ifTrue: [^ self].
	self scalePoint: newExtent asFloatPoint
			/ (originalForm extent max: 1 @ 1).
	self layoutChanged