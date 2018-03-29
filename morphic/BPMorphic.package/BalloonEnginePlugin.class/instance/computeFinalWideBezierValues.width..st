beziers-wide
computeFinalWideBezierValues: bezier width: lineWidth 
	"Get both values from the two boundaries of the given bezier 
	and compute the actual position/width of the line"
	| _gsSqueakTemp_leftX _gsSqueakTemp_rightX _gsSqueakTemp_temp |
	_gsSqueakTemp_leftX := ((self bezierUpdateDataOf: bezier)
				at: GBUpdateX)
				// 256.
	_gsSqueakTemp_rightX := ((self wideBezierUpdateDataOf: bezier)
				at: GBUpdateX)
				// 256.
	_gsSqueakTemp_leftX > _gsSqueakTemp_rightX
		ifTrue: [_gsSqueakTemp_temp := _gsSqueakTemp_leftX.
			_gsSqueakTemp_leftX := _gsSqueakTemp_rightX.
			_gsSqueakTemp_rightX := _gsSqueakTemp_temp].
	self edgeXValueOf: bezier put: _gsSqueakTemp_leftX.
	_gsSqueakTemp_rightX - _gsSqueakTemp_leftX > lineWidth
		ifTrue: [self wideBezierWidthOf: bezier put: _gsSqueakTemp_rightX - _gsSqueakTemp_leftX]
		ifFalse: [self wideBezierWidthOf: bezier put: lineWidth]