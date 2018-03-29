debug support
debugDrawLine: line 
	| _gsSqueakTemp_canvas |
	self
		assert: (self isLine: line).
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		line: (self edgeXValueOf: line)
				@ (self edgeYValueOf: line) // self aaLevelGet
		to: (self lineEndXOf: line)
				@ (self lineEndYOf: line) // self aaLevelGet
		width: 2
		color: Color red