sound primitives
primitiveShortAtPut
	"Treat the receiver, which can be indexible by either bytes or words, as
	an array
	of signed 16-bit values. Set the contents of the given index to the
	given value.
	Note that the index specifies the i-th 16-bit entry, not the i-th byte or
	word. "
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_value |
	_gsSqueakTemp_value := self stackTop.
	_gsSqueakTemp_index := self stackValue: 1.
	((objectMemory isIntegerObject: _gsSqueakTemp_value)
			and: [(objectMemory isIntegerObject: _gsSqueakTemp_index)
					and: [_gsSqueakTemp_value := objectMemory integerValueOf: _gsSqueakTemp_value.
						_gsSqueakTemp_value >= -32768
							and: [_gsSqueakTemp_value <= 32767]]])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 2.
	(objectMemory isWordsOrBytes: _gsSqueakTemp_rcvr)
		ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index
					<= (objectMemory num16BitUnitsOf: _gsSqueakTemp_rcvr)])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	objectMemory
		storeShort16: _gsSqueakTemp_index - 1
		ofObject: _gsSqueakTemp_rcvr
		withValue: _gsSqueakTemp_value.
	self
		pop: 3
		thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_value)