FILL processing
toggleWideFillOf: edge 
	| _gsSqueakTemp_fill _gsSqueakTemp_type _gsSqueakTemp_lineWidth _gsSqueakTemp_depth _gsSqueakTemp_rightX _gsSqueakTemp_index |
	_gsSqueakTemp_type := self edgeTypeOf: edge.
	dispatchedValue := edge.
	self dispatchOn: _gsSqueakTemp_type in: WideLineWidthTable.
	_gsSqueakTemp_lineWidth := dispatchReturnValue.
	self dispatchOn: _gsSqueakTemp_type in: WideLineFillTable.
	_gsSqueakTemp_fill := dispatchReturnValue.
	_gsSqueakTemp_fill = 0
		ifTrue: [^ nil].
	(self needAvailableSpace: self stackFillEntryLength)
		ifFalse: [^ nil].
	"Make sure we have enough space left"
	_gsSqueakTemp_depth := (self edgeZValueOf: edge)
				<< 1 + 1.
	"So lines sort before interior fills"
	_gsSqueakTemp_rightX := (self edgeXValueOf: edge)
				+ _gsSqueakTemp_lineWidth.
	_gsSqueakTemp_index := self findStackFill: _gsSqueakTemp_fill depth: _gsSqueakTemp_depth.
	_gsSqueakTemp_index = -1
		ifTrue: [self
				showFill: _gsSqueakTemp_fill
				depth: _gsSqueakTemp_depth
				rightX: _gsSqueakTemp_rightX]
		ifFalse: [(self stackFillRightX: _gsSqueakTemp_index)
					< _gsSqueakTemp_rightX
				ifTrue: [self stackFillRightX: _gsSqueakTemp_index put: _gsSqueakTemp_rightX]].
	self
		quickRemoveInvalidFillsAt: (self edgeXValueOf: edge)