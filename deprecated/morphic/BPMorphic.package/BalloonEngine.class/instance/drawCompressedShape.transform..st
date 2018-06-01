drawing
drawCompressedShape: shape transform: aTransform 
	| _gsSqueakTemp_fillIndexList |
	self edgeTransform: aTransform.
	self resetIfNeeded.
	_gsSqueakTemp_fillIndexList := self registerFills: shape fillStyles.
	self
		primAddCompressedShape: shape points
		segments: shape numSegments
		leftFills: shape leftFills
		rightFills: shape rightFills
		lineWidths: shape lineWidths
		lineFills: shape lineFills
		fillIndexList: _gsSqueakTemp_fillIndexList.
	self postFlushIfNeeded