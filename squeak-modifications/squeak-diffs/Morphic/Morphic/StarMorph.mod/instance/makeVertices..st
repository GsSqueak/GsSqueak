initialization
makeVertices: nSides 
	"Assuming vertices has at least one point, make a new star 
	or regular polygon (for odd sided polygons).
	The center of the polygon and the first vertex remain in
	place. The inner distances for stars remain the same also if
	possible."
	| center r1 rN rNext a1 rTotal |
	center := vertices average rounded.
	r1 := center dist: vertices first.
	rN := center dist: vertices last.
	rNext := 1 max: r1.
	a1 := 270.0
				+ (center bearingToPoint: vertices first).
	rTotal := nSides even
				ifTrue: [rNext + rNext min: rNext + rN]
				ifFalse: [rNext + rNext].
	rNext := rTotal - rNext.
	self changed .
	vertices := (a1 to: a1 + 359.999 by: 360.0 / nSides)
				collect: [:angle | center
						+ (Point r: (rNext := rTotal - rNext) degrees: angle)].
	self computeBounds.
	self changed