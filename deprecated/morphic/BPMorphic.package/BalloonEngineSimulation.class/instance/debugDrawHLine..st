debug support
debugDrawHLine: yValue 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		line: 0 @ (yValue // self aaLevelGet)
		to: Display extent x @ (yValue // self aaLevelGet)
		width: 2
		color: Color green