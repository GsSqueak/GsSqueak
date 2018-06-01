initialization
makeVertices: nSides starRatio: fraction withCenter: center withPoint: aPoint 
	"Make a new star or regular polygon (for odd sided polygons).
	This makes star vertices from scratch without any feedback from existing vertices."
	| r1 rN rNext a1 rTotal |
	r1 := center dist: aPoint.
	rNext := 1 max: r1.
	rN := (1.0 min: fraction)
				* rNext.
	a1 := 270.0
				+ (center bearingToPoint: aPoint).
	rTotal := nSides even
				ifTrue: [rNext + rNext min: rNext + rN]
				ifFalse: [rNext + rNext].
	rNext := rTotal - rNext.
	self changed.
	vertices := (a1 to: a1 + 359.999 by: 360.0 / nSides)
				collect: [:angle | center
						+ (Point r: (rNext := rTotal - rNext) degrees: angle)].
	self computeBounds.
	self changed