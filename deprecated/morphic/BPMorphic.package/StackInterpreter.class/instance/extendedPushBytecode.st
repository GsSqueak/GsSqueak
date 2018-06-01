stack bytecodes
extendedPushBytecode
	| _gsSqueakTemp_descriptor _gsSqueakTemp_variableType _gsSqueakTemp_variableIndex |
	_gsSqueakTemp_descriptor := self fetchByte.
	self fetchNextBytecode.
	_gsSqueakTemp_variableType := _gsSqueakTemp_descriptor >> 6 bitAnd: 3.
	_gsSqueakTemp_variableIndex := _gsSqueakTemp_descriptor bitAnd: 63.
	_gsSqueakTemp_variableType = 0
		ifTrue: [^ self pushReceiverVariable: _gsSqueakTemp_variableIndex].
	_gsSqueakTemp_variableType = 1
		ifTrue: [^ self pushTemporaryVariable: _gsSqueakTemp_variableIndex].
	_gsSqueakTemp_variableType = 2
		ifTrue: [^ self pushLiteralConstant: _gsSqueakTemp_variableIndex].
	_gsSqueakTemp_variableType = 3
		ifTrue: [^ self pushLiteralVariable: _gsSqueakTemp_variableIndex]