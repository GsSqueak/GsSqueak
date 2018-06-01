stack bytecodes
extStoreAndPopLiteralVariableBytecode
	"236		11101100	i i i i i i i i	Pop and Store Literal Variable #iiiiiiii (+ Extend
	A * 256)"
	| _gsSqueakTemp_variableIndex _gsSqueakTemp_value |
	_gsSqueakTemp_variableIndex := self fetchByte + (extA << 8).
	_gsSqueakTemp_value := self internalStackTop.
	self internalPop: 1.
	extA := 0.
	self storeLiteralVariable: _gsSqueakTemp_variableIndex withValue: _gsSqueakTemp_value.
	self fetchNextBytecode