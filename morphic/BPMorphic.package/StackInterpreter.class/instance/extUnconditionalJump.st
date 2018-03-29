jump bytecodes
extUnconditionalJump
	"242		11110010	i i i i i i i i	Jump i i i i i i i i (+ Extend B * 256, where
	bbbbbbbb = sddddddd, e.g. -32768 = i=0, a=0, s=1)"
	| _gsSqueakTemp_byte _gsSqueakTemp_offset _gsSqueakTemp_bcpcDelta |
	_gsSqueakTemp_byte := self fetchByte.
	_gsSqueakTemp_offset := _gsSqueakTemp_byte + (extB << 8).
	_gsSqueakTemp_bcpcDelta := _gsSqueakTemp_offset < 0
				ifTrue: [numExtB * 2]
				ifFalse: [0].
	extB := 0.
	numExtB := 0.
	localIP := localIP + _gsSqueakTemp_offset.
	self ifBackwardsCheckForEvents: _gsSqueakTemp_offset + _gsSqueakTemp_bcpcDelta.
	self fetchNextBytecode