debug support
debugDrawLineFrom: pt1 to: pt2 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		line: (pt1 at: 0)
				@ (pt1 at: 1) // self aaLevelGet
		to: (pt2 at: 0)
				@ (pt2 at: 1) // self aaLevelGet
		width: 1
		color: Color red