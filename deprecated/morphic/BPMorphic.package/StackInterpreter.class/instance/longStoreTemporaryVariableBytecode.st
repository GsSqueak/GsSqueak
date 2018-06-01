stack bytecodes
longStoreTemporaryVariableBytecode
	"234		11101010	i i i i i i i i	Store Temporary Variable #iiiiiiii"
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := self fetchByte.
	self fetchNextBytecode.
	self
		temporary: _gsSqueakTemp_index
		in: localFP
		put: self internalStackTop