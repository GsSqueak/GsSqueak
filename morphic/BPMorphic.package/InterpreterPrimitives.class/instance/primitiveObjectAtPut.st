object access primitives
primitiveObjectAtPut
	"Store a literal into a CompiledMethod at the given index. Defined for
	CompiledMethods only."
	| _gsSqueakTemp_thisReceiver _gsSqueakTemp_index _gsSqueakTemp_newValue |
	_gsSqueakTemp_newValue := self stackValue: 0.
	_gsSqueakTemp_index := self stackValue: 1.
	((objectMemory isNonIntegerObject: _gsSqueakTemp_index)
			or: [_gsSqueakTemp_index = ConstOne
					and: [objectMemory isNonIntegerObject: _gsSqueakTemp_newValue]])
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	_gsSqueakTemp_thisReceiver := self stackValue: 2.
	(objectMemory isObjImmutable: _gsSqueakTemp_thisReceiver)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	(_gsSqueakTemp_index > 0
			and: [_gsSqueakTemp_index <= ((objectMemory literalCountOf: _gsSqueakTemp_thisReceiver)
						+ LiteralStart)])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	objectMemory
		storePointer: _gsSqueakTemp_index - 1
		ofObject: _gsSqueakTemp_thisReceiver
		withValue: _gsSqueakTemp_newValue.
	self pop: 3 thenPush: _gsSqueakTemp_newValue