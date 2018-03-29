beziers-simple
stepToNextBezierIn: bezier at: yValue 
	"Incrementally step to the next scan line in the given bezier"
	| _gsSqueakTemp_xValue |
	_gsSqueakTemp_xValue := self
				stepToNextBezierForward: (self bezierUpdateDataOf: bezier)
				at: yValue.
	self edgeXValueOf: bezier put: _gsSqueakTemp_xValue