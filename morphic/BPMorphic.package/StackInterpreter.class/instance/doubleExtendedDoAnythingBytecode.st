send bytecodes
doubleExtendedDoAnythingBytecode
	"Replaces the Blue Book double-extended send [132], in which the
	first byte was wasted on 8 bits of argument count. 
	Here we use 3 bits for the operation sub-type (opType), and the
	remaining 5 bits for argument count where needed. 
	The last byte give access to 256 instVars or literals. 
	See also secondExtendedSendBytecode"
	| _gsSqueakTemp_byte2 _gsSqueakTemp_byte3 _gsSqueakTemp_opType _gsSqueakTemp_top |
	_gsSqueakTemp_byte2 := self fetchByte.
	_gsSqueakTemp_byte3 := self fetchByte.
	_gsSqueakTemp_opType := _gsSqueakTemp_byte2 >> 5.
	_gsSqueakTemp_opType = 0
		ifTrue: [messageSelector := self literal: _gsSqueakTemp_byte3.
			argumentCount := _gsSqueakTemp_byte2 bitAnd: 31.
			^ self normalSend].
	_gsSqueakTemp_opType = 1
		ifTrue: [messageSelector := self literal: _gsSqueakTemp_byte3.
			argumentCount := _gsSqueakTemp_byte2 bitAnd: 31.
			^ self superclassSend].
	_gsSqueakTemp_opType = 2
		ifTrue: [self fetchNextBytecode.
			^ self pushMaybeContextReceiverVariable: _gsSqueakTemp_byte3].
	_gsSqueakTemp_opType = 3
		ifTrue: [self fetchNextBytecode.
			^ self pushLiteralConstant: _gsSqueakTemp_byte3].
	_gsSqueakTemp_opType = 4
		ifTrue: [self fetchNextBytecode.
			^ self pushLiteralVariable: _gsSqueakTemp_byte3].
	_gsSqueakTemp_top := self internalStackTop.
	_gsSqueakTemp_opType = 7
		ifTrue: [self storeLiteralVariable: _gsSqueakTemp_byte3 withValue: _gsSqueakTemp_top.
			^ self fetchNextBytecode].
	"opType = 5 is store; opType = 6 is storePop"
	_gsSqueakTemp_opType = 6
		ifTrue: [self internalPop: 1].
	self storeMaybeContextReceiverVariable: _gsSqueakTemp_byte3 withValue: _gsSqueakTemp_top.
	self fetchNextBytecode