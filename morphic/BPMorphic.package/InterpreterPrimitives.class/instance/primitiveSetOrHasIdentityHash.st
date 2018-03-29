object access primitives
primitiveSetOrHasIdentityHash
	| _gsSqueakTemp_hash _gsSqueakTemp_oldHash _gsSqueakTemp_thisReceiver _gsSqueakTemp_isReceiverAClass |
	argumentCount = 0
		ifTrue: [| hasHash |
			hasHash := (objectMemory isNonImmediate: self stackTop)
						and: [objectMemory hasIdentityHash: self stackTop].
			self pop: argumentCount + 1 thenPushBool: hasHash.
			^ self].
	argumentCount = 2
		ifTrue: [_gsSqueakTemp_isReceiverAClass := self booleanValueOf: self stackTop.
			self successful
				ifFalse: [self primitiveFailFor: PrimErrBadArgument]]
		ifFalse: [_gsSqueakTemp_isReceiverAClass := false].
	_gsSqueakTemp_hash := self stackIntegerValue: argumentCount - 1.
	_gsSqueakTemp_thisReceiver := self stackObjectValue: argumentCount.
	self successful
		ifTrue: [_gsSqueakTemp_oldHash := objectMemory hashBitsOf: _gsSqueakTemp_thisReceiver.
			objectMemory setHashBitsOf: _gsSqueakTemp_thisReceiver to: _gsSqueakTemp_hash.
			(_gsSqueakTemp_isReceiverAClass
					and: [objectMemory hasSpurMemoryManagerAPI])
				ifTrue: [objectMemory classAtIndex: _gsSqueakTemp_hash put: _gsSqueakTemp_thisReceiver.
					"next line figures out if the index is anbiguous and fix
					all the instances if needed"
					objectMemory allInstancesOf: _gsSqueakTemp_thisReceiver].
			self pop: argumentCount + 1 thenPushInteger: _gsSqueakTemp_oldHash]