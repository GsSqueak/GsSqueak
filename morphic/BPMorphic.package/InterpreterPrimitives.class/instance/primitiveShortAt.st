sound primitives
primitiveShortAt
	"Treat the receiver, which can be indexible by either bytes or words, as
	an array of signed 16-bit values. Answer the contents of the given
	index. Note that the index specifies the i-th 16-bit entry, not the i-th
	byte or word."
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_value |
	_gsSqueakTemp_index := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_index)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isWordsOrBytes: _gsSqueakTemp_rcvr)
		ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index
					<= (objectMemory num16BitUnitsOf: _gsSqueakTemp_rcvr)])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_value := objectMemory fetchShort16: _gsSqueakTemp_index - 1 ofObject: _gsSqueakTemp_rcvr.
	self
		cCode: []
		inSmalltalk: [_gsSqueakTemp_value > 32767
				ifTrue: [_gsSqueakTemp_value := _gsSqueakTemp_value - 65536]].
	self pop: 2 thenPushInteger: _gsSqueakTemp_value