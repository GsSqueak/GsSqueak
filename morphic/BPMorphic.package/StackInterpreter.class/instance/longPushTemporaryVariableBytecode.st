stack bytecodes
longPushTemporaryVariableBytecode
	"230		11100110	i i i i i i i i	Push Temporary Variable #iiiiiiii"
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := self fetchByte.
	self fetchNextBytecode.
	self
		internalPush: (self temporary: _gsSqueakTemp_index in: localFP)