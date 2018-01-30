drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth topLeftColor: topLeftColor bottomRightColor: bottomRightColor 
	"Draw the rectangle using the given attributes.
	Note: This is a *very* simple implementation"
	| _gsSqueakTemp_bw _gsSqueakTemp_pt |
	self
		frameAndFillRectangle: r
		fillColor: fillColor
		borderWidth: borderWidth
		borderColor: bottomRightColor.
	bottomRightColor = topLeftColor
		ifFalse: [_gsSqueakTemp_bw := borderWidth asPoint.
			_gsSqueakTemp_pt := r topLeft + (_gsSqueakTemp_bw // 2).
			self
				line: _gsSqueakTemp_pt
				to: _gsSqueakTemp_pt + (r extent x - _gsSqueakTemp_bw x @ 0)
				width: borderWidth
				color: topLeftColor.
			self
				line: _gsSqueakTemp_pt
				to: _gsSqueakTemp_pt + (0 @ (r extent y - _gsSqueakTemp_bw y))
				width: borderWidth
				color: topLeftColor]