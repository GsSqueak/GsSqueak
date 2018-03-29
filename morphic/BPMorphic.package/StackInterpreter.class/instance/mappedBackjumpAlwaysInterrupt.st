sista bytecodes
mappedBackjumpAlwaysInterrupt
	| _gsSqueakTemp_top _gsSqueakTemp_offset |
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_offset := objectMemory integerObjectOf: _gsSqueakTemp_top.
	localIP := localIP - _gsSqueakTemp_offset.
	self internalPop: 1.
	"+1 since this instr is 3 bytes not 2"
	self ifBackwardsCheckForEvents: 0 - _gsSqueakTemp_offset + 1.
	localIP := localIP - 1.
	self fetchNextBytecode