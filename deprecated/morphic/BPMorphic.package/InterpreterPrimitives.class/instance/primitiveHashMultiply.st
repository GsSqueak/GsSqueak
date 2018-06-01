arithmetic integer primitives
primitiveHashMultiply
	"Implement 28-bit hashMultiply for SmallInteger and
	LargePositiveInteger receivers."
	| _gsSqueakTemp_value |
	_gsSqueakTemp_value := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_value)
		ifTrue: [_gsSqueakTemp_value := objectMemory integerValueOf: _gsSqueakTemp_value]
		ifFalse: [| ok |
			ok := objectMemory
						is: _gsSqueakTemp_value
						instanceOf: (objectMemory splObj: ClassLargePositiveInteger)
						compactClassIndex: ClassLargePositiveIntegerCompactIndex.
			ok
				ifFalse: [^ self primitiveFailFor: PrimErrBadReceiver].
			_gsSqueakTemp_value := objectMemory
						byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: _gsSqueakTemp_value)].
	self
		pop: 1
		thenPush: (objectMemory
				integerObjectOf: (_gsSqueakTemp_value * HashMultiplyConstant bitAnd: 268435455))