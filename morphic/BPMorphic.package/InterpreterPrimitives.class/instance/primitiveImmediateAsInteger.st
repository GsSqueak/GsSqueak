arithmetic float primitives
primitiveImmediateAsInteger
	"For a Smalllnteger, answer itself.
	For a Character, answer its code as an unsigned integer.
	For a SmallFloat, answer the signed, but unadjusted bit pattern (so as
	to keep the result a SmallInteger).
	This is a good value for an immediate's hash."
	| _gsSqueakTemp_oop _gsSqueakTemp_value |
	_gsSqueakTemp_oop := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_oop)
		ifTrue: [_gsSqueakTemp_value := objectMemory integerValueOf: _gsSqueakTemp_oop]
		ifFalse: [(objectMemory isCharacterObject: _gsSqueakTemp_oop)
				ifTrue: [_gsSqueakTemp_value := objectMemory characterValueOf: _gsSqueakTemp_oop]
				ifFalse: [(objectMemory isImmediateFloat: _gsSqueakTemp_oop)
						ifTrue: [_gsSqueakTemp_value := objectMemory rotatedFloatBitsOf: _gsSqueakTemp_oop]
						ifFalse: [^ self primitiveFailFor: PrimErrBadReceiver]]].
	self pop: argumentCount + 1 thenPushInteger: _gsSqueakTemp_value