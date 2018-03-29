sound primitives
primitiveIntegerAtPut
	"Return the 32bit signed integer contents of a words receiver"
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_sz _gsSqueakTemp_addr _gsSqueakTemp_value _gsSqueakTemp_valueOop |
	_gsSqueakTemp_valueOop := self stackValue: 0.
	_gsSqueakTemp_index := self stackIntegerValue: 1.
	_gsSqueakTemp_value := self signed32BitValueOf: _gsSqueakTemp_valueOop.
	self successful
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 2.
	(objectMemory isWords: _gsSqueakTemp_rcvr)
		ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_sz := objectMemory lengthOf: _gsSqueakTemp_rcvr.
	"number of fields"
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index <= _gsSqueakTemp_sz])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	"4 = 32 bits / 8"
	_gsSqueakTemp_addr := _gsSqueakTemp_rcvr + objectMemory baseHeaderSize + (_gsSqueakTemp_index - 1 * 4).
	"for zero indexing"
	_gsSqueakTemp_value := objectMemory intAt: _gsSqueakTemp_addr put: _gsSqueakTemp_value.
	self pop: 3 thenPush: _gsSqueakTemp_valueOop
	"pop all; return value"