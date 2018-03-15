geometry-testing
triangle: points containsPoint: p 
	"Computes if p is in the triangle defined by points.
	p should be a Point, and points should be an array with three Points.
	I took the algorithm from the bottom of this page: 
	http://www.blackpawn.com/texts/pointinpoly/default.html"
	| _gsSqueakTemp_a _gsSqueakTemp_b _gsSqueakTemp_c _gsSqueakTemp_v0 _gsSqueakTemp_v1 _gsSqueakTemp_v2 _gsSqueakTemp_dot00 _gsSqueakTemp_dot01 _gsSqueakTemp_dot02 _gsSqueakTemp_dot11 _gsSqueakTemp_dot12 _gsSqueakTemp_denom _gsSqueakTemp_invDenom _gsSqueakTemp_u _gsSqueakTemp_v |
	_gsSqueakTemp_a := points first.
	_gsSqueakTemp_b := points second.
	_gsSqueakTemp_c := points third.
	"Compute vectors"
	_gsSqueakTemp_v0 := _gsSqueakTemp_c - _gsSqueakTemp_a.
	_gsSqueakTemp_v1 := _gsSqueakTemp_b - _gsSqueakTemp_a.
	_gsSqueakTemp_v2 := p - _gsSqueakTemp_a.
	"Compute dot products"
	_gsSqueakTemp_dot00 := _gsSqueakTemp_v0 dotProduct: _gsSqueakTemp_v0.
	_gsSqueakTemp_dot01 := _gsSqueakTemp_v0 dotProduct: _gsSqueakTemp_v1.
	_gsSqueakTemp_dot02 := _gsSqueakTemp_v0 dotProduct: _gsSqueakTemp_v2.
	_gsSqueakTemp_dot11 := _gsSqueakTemp_v1 dotProduct: _gsSqueakTemp_v1.
	_gsSqueakTemp_dot12 := _gsSqueakTemp_v1 dotProduct: _gsSqueakTemp_v2.
	"Compute barycentric coordinates"
	_gsSqueakTemp_denom := _gsSqueakTemp_dot00 * _gsSqueakTemp_dot11 - (_gsSqueakTemp_dot01 * _gsSqueakTemp_dot01).
	_gsSqueakTemp_denom = 0
		ifTrue: [^ false].
	_gsSqueakTemp_invDenom := 1 / _gsSqueakTemp_denom.
	_gsSqueakTemp_u := _gsSqueakTemp_dot11 * _gsSqueakTemp_dot02 - (_gsSqueakTemp_dot01 * _gsSqueakTemp_dot12) * _gsSqueakTemp_invDenom.
	_gsSqueakTemp_v := _gsSqueakTemp_dot00 * _gsSqueakTemp_dot12 - (_gsSqueakTemp_dot01 * _gsSqueakTemp_dot02) * _gsSqueakTemp_invDenom.
	"Check if point is in triangle"
	^ _gsSqueakTemp_u >= 0
		and: [_gsSqueakTemp_v >= 0
				and: [_gsSqueakTemp_u + _gsSqueakTemp_v <= 1]]