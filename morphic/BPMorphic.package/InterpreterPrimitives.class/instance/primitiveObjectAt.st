object access primitives
primitiveObjectAt
	"Defined for CompiledMethods only"
	| _gsSqueakTemp_thisReceiver _gsSqueakTemp_index |
	_gsSqueakTemp_index := self stackIntegerValue: 0.
	self successful
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_thisReceiver := self stackValue: 1.
	(_gsSqueakTemp_index > 0
			and: [_gsSqueakTemp_index <= ((objectMemory literalCountOf: _gsSqueakTemp_thisReceiver)
						+ LiteralStart)])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	self
		pop: 2
		thenPush: (objectMemory fetchPointer: _gsSqueakTemp_index - 1 ofObject: _gsSqueakTemp_thisReceiver)