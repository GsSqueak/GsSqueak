drawing
drawBezierShape: points fill: fillStyle borderWidth: borderWidth borderColor: borderFill transform: aTransform 
	| _gsSqueakTemp_fills |
	self edgeTransform: aTransform.
	self resetIfNeeded.
	_gsSqueakTemp_fills := self registerFill: fillStyle and: borderFill.
	self
		primAddBezierShape: points
		segments: points size // 3
		fill: (_gsSqueakTemp_fills at: 1)
		lineWidth: borderWidth
		lineFill: (_gsSqueakTemp_fills at: 2).
	self postFlushIfNeeded