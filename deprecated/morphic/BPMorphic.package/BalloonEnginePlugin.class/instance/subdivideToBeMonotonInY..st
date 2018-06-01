bezier-loading
subdivideToBeMonotonInY: index 
	"Check if the given bezier curve is monoton in Y. If not, subdivide it"
	| _gsSqueakTemp_startY _gsSqueakTemp_viaY _gsSqueakTemp_endY _gsSqueakTemp_dy1 _gsSqueakTemp_dy2 _gsSqueakTemp_denom _gsSqueakTemp_num |
	_gsSqueakTemp_startY := self bzStartY: index.
	_gsSqueakTemp_viaY := self bzViaY: index.
	_gsSqueakTemp_endY := self bzEndY: index.
	_gsSqueakTemp_dy1 := _gsSqueakTemp_viaY - _gsSqueakTemp_startY.
	_gsSqueakTemp_dy2 := _gsSqueakTemp_endY - _gsSqueakTemp_viaY.
	_gsSqueakTemp_dy1 * _gsSqueakTemp_dy2 >= 0
		ifTrue: [^ index].
	"Bezier is monoton"
	self incrementStat: GWBezierMonotonSubdivisions by: 1.
	"Compute split value"
	_gsSqueakTemp_denom := _gsSqueakTemp_dy2 - _gsSqueakTemp_dy1.
	_gsSqueakTemp_num := _gsSqueakTemp_dy1.
	_gsSqueakTemp_num < 0
		ifTrue: [_gsSqueakTemp_num := 0 - _gsSqueakTemp_num].
	_gsSqueakTemp_denom < 0
		ifTrue: [_gsSqueakTemp_denom := 0 - _gsSqueakTemp_denom].
	^ self computeBezier: index splitAt: _gsSqueakTemp_num asFloat / _gsSqueakTemp_denom asFloat