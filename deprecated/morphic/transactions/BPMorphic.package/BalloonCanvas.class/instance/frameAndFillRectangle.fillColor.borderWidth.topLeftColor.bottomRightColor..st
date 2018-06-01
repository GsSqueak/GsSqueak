drawing
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth topLeftColor: topLeftColor bottomRightColor: bottomRightColor 
	"Draw a beveled or raised rectangle"
	"Note: The optimization test below should actually read:
	self ifNoTransformWithIn: (r insetBy: borderWidth // 2)
	but since borderWidth is assumed to be very small related to r we
	don't check it."
	| _gsSqueakTemp_bw |
	(self ifNoTransformWithIn: r)
		ifTrue: [^ super
				frameAndFillRectangle: r
				fillColor: fillColor
				borderWidth: borderWidth
				topLeftColor: topLeftColor
				bottomRightColor: bottomRightColor].
	"Fill rectangle and draw top and left border"
	_gsSqueakTemp_bw := borderWidth // 2.
	self
		drawRectangle: (r insetBy: _gsSqueakTemp_bw)
		color: fillColor
		borderWidth: borderWidth
		borderColor: topLeftColor.
	"Now draw bottom right border."
	self
		drawPolygon: (Array
				with: r topRight + (_gsSqueakTemp_bw negated @ _gsSqueakTemp_bw)
				with: r bottomRight - _gsSqueakTemp_bw asPoint
				with: r bottomLeft + (_gsSqueakTemp_bw @ _gsSqueakTemp_bw negated))
		color: nil
		borderWidth: borderWidth
		borderColor: bottomRightColor