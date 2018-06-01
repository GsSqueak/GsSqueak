object access primitives
primitiveSomeInstance
	| _gsSqueakTemp_class _gsSqueakTemp_instance |
	_gsSqueakTemp_class := self stackTop.
	NewspeakVM
		ifTrue: ["For the mirror prims check that the class obj is actually a valid
			class. "
			(argumentCount < 1
					or: [(objectMemory isNonImmediate: _gsSqueakTemp_class)
							and: [self objCouldBeClassObj: _gsSqueakTemp_class]])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]].
	_gsSqueakTemp_instance := objectMemory initialInstanceOf: _gsSqueakTemp_class.
	_gsSqueakTemp_instance
		ifNil: [self primitiveFail]
		ifNotNil: [self pop: argumentCount + 1 thenPush: _gsSqueakTemp_instance]