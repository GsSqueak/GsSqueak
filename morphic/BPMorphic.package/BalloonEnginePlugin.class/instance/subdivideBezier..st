bezier-loading
subdivideBezier: index 
	"Subdivide the given bezier curve if necessary"
	| _gsSqueakTemp_startX _gsSqueakTemp_startY _gsSqueakTemp_endX _gsSqueakTemp_endY _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY |
	_gsSqueakTemp_startY := self bzStartY: index.
	_gsSqueakTemp_endY := self bzEndY: index.
	"If the receiver is horizontal, don't do anything"
	_gsSqueakTemp_endY = _gsSqueakTemp_startY
		ifTrue: [^ index].
	"TODO: If the curve can be represented as a line, then do so"
	"If the height of the curve exceeds 256 pixels, subdivide 
	(forward differencing is numerically not very stable)"
	_gsSqueakTemp_deltaY := _gsSqueakTemp_endY - _gsSqueakTemp_startY.
	_gsSqueakTemp_deltaY < 0
		ifTrue: [_gsSqueakTemp_deltaY := 0 - _gsSqueakTemp_deltaY].
	_gsSqueakTemp_deltaY > 255
		ifTrue: [self incrementStat: GWBezierHeightSubdivisions by: 1.
			^ self computeBezierSplitAtHalf: index].
	"Check if the incremental values could possibly overflow the scaled
	integer range"
	_gsSqueakTemp_startX := self bzStartX: index.
	_gsSqueakTemp_endX := self bzEndX: index.
	_gsSqueakTemp_deltaX := _gsSqueakTemp_endX - _gsSqueakTemp_startX.
	_gsSqueakTemp_deltaX < 0
		ifTrue: [_gsSqueakTemp_deltaX := 0 - _gsSqueakTemp_deltaX].
	_gsSqueakTemp_deltaY * 32 < _gsSqueakTemp_deltaX
		ifTrue: [self incrementStat: GWBezierOverflowSubdivisions by: 1.
			^ self computeBezierSplitAtHalf: index].
	^ index