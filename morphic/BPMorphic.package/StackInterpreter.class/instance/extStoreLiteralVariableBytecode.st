stack bytecodes
extStoreLiteralVariableBytecode
	"233		11101001	i i i i i i i i	Store Literal Variable #iiiiiiii (+ Extend A * 256)"
	| _gsSqueakTemp_variableIndex |
	_gsSqueakTemp_variableIndex := self fetchByte + (extA << 8).
	extA := 0.
	self storeLiteralVariable: _gsSqueakTemp_variableIndex withValue: self internalStackTop.
	self fetchNextBytecode