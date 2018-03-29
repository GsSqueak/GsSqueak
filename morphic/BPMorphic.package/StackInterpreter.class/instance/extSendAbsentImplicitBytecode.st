send bytecodes
extSendAbsentImplicitBytecode
	"240		11110000	i i i i i j j j	Send To Absent Implicit Receiver Literal
	Selector #iiiii (+ Extend A * 32) with jjj (+ Extend B * 8) Arguments"
	| _gsSqueakTemp_byte |
	_gsSqueakTemp_byte := self fetchByte.
	messageSelector := self literal: _gsSqueakTemp_byte >> 3 + (extA << 5).
	extA := 0.
	argumentCount := (_gsSqueakTemp_byte bitAnd: 7)
				+ (extB << 3).
	extB := 0.
	numExtB := 0.
	self commonSendImplicitReceiver