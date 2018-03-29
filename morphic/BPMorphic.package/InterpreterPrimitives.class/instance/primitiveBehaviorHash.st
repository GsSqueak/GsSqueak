object access primitives
primitiveBehaviorHash
	| _gsSqueakTemp_hashOrError |
	NewspeakVM
		ifTrue: ["For the mirror prims check that the class obj is actually a valid
			class. "
			argumentCount > 0
				ifTrue: [((objectMemory isNonImmediate: self stackTop)
							and: [self objCouldBeClassObj: self stackTop])
						ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]]].
	self
		assert: ((objectMemory isNonImmediate: self stackTop)
				and: [self addressCouldBeClassObj: self stackTop]).
	_gsSqueakTemp_hashOrError := objectMemory ensureBehaviorHash: self stackTop.
	_gsSqueakTemp_hashOrError >= 0
		ifTrue: [self pop: argumentCount + 1 thenPushInteger: _gsSqueakTemp_hashOrError]
		ifFalse: [self primitiveFailFor: _gsSqueakTemp_hashOrError negated]