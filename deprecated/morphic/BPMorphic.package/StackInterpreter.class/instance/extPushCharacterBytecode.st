stack bytecodes
extPushCharacterBytecode
	"SistaV1:	*	233		11101001	iiiiiiii		Push Character #iiiiiiii (+ Extend B * 256)"
	| _gsSqueakTemp_value |
	_gsSqueakTemp_value := self fetchByte + (extB << 8).
	self fetchNextBytecode.
	self
		internalPush: (objectMemory characterObjectOf: _gsSqueakTemp_value).
	numExtB := extB := 0