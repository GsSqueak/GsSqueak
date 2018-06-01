stack bytecodes
pushActiveContextBytecode
	| _gsSqueakTemp_ourContext |
	_gsSqueakTemp_ourContext := self ensureFrameIsMarried: localFP SP: localSP.
	self fetchNextBytecode.
	self internalPush: _gsSqueakTemp_ourContext