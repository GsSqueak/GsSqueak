drawing
drawRectangle: rect fill: fillStyle borderWidth: borderWidth borderColor: borderColor transform: aMatrix 
	| _gsSqueakTemp_fills |
	self edgeTransform: aMatrix.
	self resetIfNeeded.
	_gsSqueakTemp_fills := self registerFill: fillStyle and: borderColor.
	self
		primAddRectFrom: rect origin
		to: rect corner
		fillIndex: (_gsSqueakTemp_fills at: 1)
		borderWidth: borderWidth
		borderColor: (_gsSqueakTemp_fills at: 2).
	self postFlushIfNeeded