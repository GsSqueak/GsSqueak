jump bytecodes
extJumpIfTrue
	"243		11110011	i i i i i i i i	Pop and Jump 0n True i i i i i i i i (+ Extend B *
	256, where Extend B >= 0)"
	| _gsSqueakTemp_byte _gsSqueakTemp_offset |
	_gsSqueakTemp_byte := self fetchByte.
	_gsSqueakTemp_offset := _gsSqueakTemp_byte + (extB << 8).
	numExtB := extB := extA := 0.
	self jumplfTrueBy: _gsSqueakTemp_offset