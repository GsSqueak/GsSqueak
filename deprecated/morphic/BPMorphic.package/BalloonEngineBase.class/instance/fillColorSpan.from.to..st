displaying
fillColorSpan: pixelValue32 from: leftX to: rightX 
	"Fill the span buffer between leftEdge and rightEdge with the given
	pixel value."
	| _gsSqueakTemp_x0 _gsSqueakTemp_x1 |
	"Use a unrolled version for anti-aliased fills..."
	self aaLevelGet = 1
		ifFalse: [^ self
				fillColorSpanAA: pixelValue32
				x0: leftX
				x1: rightX].
	_gsSqueakTemp_x0 := leftX.
	_gsSqueakTemp_x1 := rightX.
	"Unroll the inner loop four times, since we're only storing data."
	[_gsSqueakTemp_x0 + 4 < _gsSqueakTemp_x1]
		whileTrue: [spanBuffer at: _gsSqueakTemp_x0 put: pixelValue32.
			spanBuffer at: _gsSqueakTemp_x0 + 1 put: pixelValue32.
			spanBuffer at: _gsSqueakTemp_x0 + 2 put: pixelValue32.
			spanBuffer at: _gsSqueakTemp_x0 + 3 put: pixelValue32.
			_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 4].
	[_gsSqueakTemp_x0 < _gsSqueakTemp_x1]
		whileTrue: [spanBuffer at: _gsSqueakTemp_x0 put: pixelValue32.
			_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 1]