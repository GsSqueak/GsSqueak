geometry-testing
triangle: points containsPoint: p
	" Computes if p is in the triangle defined by points.
	p should be a Point, and points should be an array with three Points.
	I took the algorithm from the bottom of this page: 
		http://www.blackpawn.com/texts/pointinpoly/default.html "

	| a b c v0 v1 v2 dot00 dot01 dot02 dot11 dot12 denom invDenom u v |
	a := points first.
	b := points second.
	c := points third.
	" Compute vectors "
	v0 := c - a.
	v1 := b - a.
	v2 := p - a.
	" Compute dot products "
	dot00 := v0 dotProduct: v0.
	dot01 := v0 dotProduct: v1.
	dot02 := v0 dotProduct: v2.
	dot11 := v1 dotProduct: v1.
	dot12 := v1 dotProduct: v2.
	" Compute barycentric coordinates "
	denom := dot00 * dot11 - (dot01 * dot01).
	denom = 0 ifTrue: [ ^false ].
	invDenom := 1 / denom.
	u := (dot11 * dot02 - (dot01 * dot12)) * invDenom.
	v := (dot00 * dot12 - (dot01 * dot02)) * invDenom.
	" Check if point is in triangle "
	^u >= 0 and: [ v >= 0 and: [ u + v <= 1 ] ]