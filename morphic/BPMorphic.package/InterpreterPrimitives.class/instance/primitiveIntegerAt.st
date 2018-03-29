sound primitives
primitiveIntegerAt
	"Return the 32bit signed integer contents of a words receiver"
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_sz _gsSqueakTemp_addr _gsSqueakTemp_intValue _gsSqueakTemp_result |
	_gsSqueakTemp_index := self stackValue: 0.
	(objectMemory isIntegerObject: _gsSqueakTemp_index)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isWords: _gsSqueakTemp_rcvr)
		ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	_gsSqueakTemp_sz := objectMemory lengthOf: _gsSqueakTemp_rcvr.
	"number of fields"
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index <= _gsSqueakTemp_sz])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	"4 = 32 bits / 8"
	_gsSqueakTemp_addr := _gsSqueakTemp_rcvr + objectMemory baseHeaderSize + (_gsSqueakTemp_index - 1 * 4).
	"for zero indexing"
	_gsSqueakTemp_intValue := objectMemory intAt: _gsSqueakTemp_addr.
	_gsSqueakTemp_result := self signed32BitIntegerFor: _gsSqueakTemp_intValue.
	self pop: 2 thenPush: _gsSqueakTemp_result