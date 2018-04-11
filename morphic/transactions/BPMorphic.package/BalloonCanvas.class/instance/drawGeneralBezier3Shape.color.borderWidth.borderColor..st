balloon drawing
drawGeneralBezier3Shape: contours color: c borderWidth: borderWidth borderColor: borderColor 
	| _gsSqueakTemp_b2 |
	_gsSqueakTemp_b2 := contours
				collect: [:b3 | Bezier3Segment convertBezier3ToBezier2: b3].
	self
		drawGeneralBezierShape: _gsSqueakTemp_b2
		color: c
		borderWidth: borderWidth
		borderColor: borderColor