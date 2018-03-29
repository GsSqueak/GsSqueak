FILL processing
toggleFillsOf: edge 
	| _gsSqueakTemp_depth _gsSqueakTemp_fillIndex |
	(self needAvailableSpace: self stackFillEntryLength * 2)
		ifFalse: [^ nil].
	"Make sure we have enough space left"
	_gsSqueakTemp_depth := (self edgeZValueOf: edge)
				<< 1.
	_gsSqueakTemp_fillIndex := self edgeLeftFillOf: edge.
	_gsSqueakTemp_fillIndex = 0
		ifFalse: [self
				toggleFill: _gsSqueakTemp_fillIndex
				depth: _gsSqueakTemp_depth
				rightX: 999999999].
	_gsSqueakTemp_fillIndex := self edgeRightFillOf: edge.
	_gsSqueakTemp_fillIndex = 0
		ifFalse: [self
				toggleFill: _gsSqueakTemp_fillIndex
				depth: _gsSqueakTemp_depth
				rightX: 999999999].
	self
		quickRemoveInvalidFillsAt: (self edgeXValueOf: edge)