debug support
debugDrawPt: pt 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		fillRectangle: (pt - 2 corner: pt + 2)
		color: Color red