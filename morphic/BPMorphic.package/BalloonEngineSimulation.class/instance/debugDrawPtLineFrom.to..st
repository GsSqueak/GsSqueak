debug support
debugDrawPtLineFrom: pt1 to: pt2 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		line: pt1
		to: pt2
		width: 1
		color: Color red