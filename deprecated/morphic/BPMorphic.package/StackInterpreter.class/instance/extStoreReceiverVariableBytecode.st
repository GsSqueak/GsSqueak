stack bytecodes
extStoreReceiverVariableBytecode
	"232		11101000	i i i i i i i i	Store Receiver Variable #iiiiiii (+ Extend A *
	256) "
	| _gsSqueakTemp_variableIndex |
	_gsSqueakTemp_variableIndex := self fetchByte + (extA << 8).
	extA := 0.
	self storeMaybeContextReceiverVariable: _gsSqueakTemp_variableIndex withValue: self internalStackTop.
	self fetchNextBytecode