jump bytecodes
extJumpIfFalse
	"244		11110100	i i i i i i i i	Pop and Jump 0n False i i i i i i i i (+ Extend B *
	256, where Extend B >= 0)"
	| _gsSqueakTemp_byte _gsSqueakTemp_offset |
	_gsSqueakTemp_byte := self fetchByte.
	_gsSqueakTemp_offset := _gsSqueakTemp_byte + (extB << 8).
	numExtB := extB := extA := 0.
	self jumplfFalseBy: _gsSqueakTemp_offset