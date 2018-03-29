stack bytecodes
extStoreAndPopReceiverVariableBytecode
	"235		11101011	i i i i i i i i	Pop and Store Receiver Variable #iiiiiii (+
	Extend A * 256)"
	| _gsSqueakTemp_variableIndex _gsSqueakTemp_value |
	_gsSqueakTemp_variableIndex := self fetchByte + (extA << 8).
	extA := 0.
	_gsSqueakTemp_value := self internalStackTop.
	self internalPop: 1.
	self storeMaybeContextReceiverVariable: _gsSqueakTemp_variableIndex withValue: _gsSqueakTemp_value.
	self fetchNextBytecode