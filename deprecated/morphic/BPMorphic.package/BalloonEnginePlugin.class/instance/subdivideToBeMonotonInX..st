bezier-loading
subdivideToBeMonotonInX: index 
	"Check if the given bezier curve is monoton in X. If not, subdivide it"
	| _gsSqueakTemp_denom _gsSqueakTemp_num _gsSqueakTemp_startX _gsSqueakTemp_viaX _gsSqueakTemp_endX _gsSqueakTemp_dx1 _gsSqueakTemp_dx2 |
	_gsSqueakTemp_startX := self bzStartX: index.
	_gsSqueakTemp_viaX := self bzViaX: index.
	_gsSqueakTemp_endX := self bzEndX: index.
	_gsSqueakTemp_dx1 := _gsSqueakTemp_viaX - _gsSqueakTemp_startX.
	_gsSqueakTemp_dx2 := _gsSqueakTemp_endX - _gsSqueakTemp_viaX.
	_gsSqueakTemp_dx1 * _gsSqueakTemp_dx2 >= 0
		ifTrue: [^ index].
	"Bezier is monoton"
	self incrementStat: GWBezierMonotonSubdivisions by: 1.
	"Compute split value"
	_gsSqueakTemp_denom := _gsSqueakTemp_dx2 - _gsSqueakTemp_dx1.
	_gsSqueakTemp_num := _gsSqueakTemp_dx1.
	_gsSqueakTemp_num < 0
		ifTrue: [_gsSqueakTemp_num := 0 - _gsSqueakTemp_num].
	_gsSqueakTemp_denom < 0
		ifTrue: [_gsSqueakTemp_denom := 0 - _gsSqueakTemp_denom].
	^ self computeBezier: index splitAt: _gsSqueakTemp_num asFloat / _gsSqueakTemp_denom asFloat