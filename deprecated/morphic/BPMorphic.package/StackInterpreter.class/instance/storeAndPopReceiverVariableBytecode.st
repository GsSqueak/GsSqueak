stack bytecodes
storeAndPopReceiverVariableBytecode
	| _gsSqueakTemp_rcvr _gsSqueakTemp_top _gsSqueakTemp_instVarIndex |
	_gsSqueakTemp_rcvr := self receiver.
	_gsSqueakTemp_top := self internalStackTop.
	_gsSqueakTemp_instVarIndex := currentBytecode bitAnd: 7.
	self internalPop: 1.
	objectMemory
		storePointerImmutabilityCheck: _gsSqueakTemp_instVarIndex
		ofObject: _gsSqueakTemp_rcvr
		withValue: _gsSqueakTemp_top.
	self fetchNextBytecode