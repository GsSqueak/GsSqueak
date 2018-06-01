jump bytecodes
longUnconditionalJump
	| _gsSqueakTemp_offset |
	_gsSqueakTemp_offset := (currentBytecode bitAnd: 7)
				- 4 * 256 + self fetchByte.
	localIP := localIP + _gsSqueakTemp_offset.
	self ifBackwardsCheckForEvents: _gsSqueakTemp_offset.
	self fetchNextBytecode