debug support
debugDrawBezier: line 
	| _gsSqueakTemp_canvas _gsSqueakTemp_p1 _gsSqueakTemp_p2 _gsSqueakTemp_p3 |
	self
		assert: (self isBezier: line).
	_gsSqueakTemp_p1 := (self edgeXValueOf: line)
				@ (self edgeYValueOf: line) // self aaLevelGet.
	_gsSqueakTemp_p2 := (self bezierViaXOf: line)
				@ (self bezierViaYOf: line) // self aaLevelGet.
	_gsSqueakTemp_p3 := (self bezierEndXOf: line)
				@ (self bezierEndYOf: line) // self aaLevelGet.
	_gsSqueakTemp_canvas := Display getCanvas.
	_gsSqueakTemp_canvas
		line: _gsSqueakTemp_p1
		to: _gsSqueakTemp_p2
		width: 2
		color: Color blue;
		
		line: _gsSqueakTemp_p2
		to: _gsSqueakTemp_p3
		width: 2
		color: Color blue