object access primitives
primitiveIdentityHash
	| _gsSqueakTemp_thisReceiver |
	_gsSqueakTemp_thisReceiver := self stackTop.
	((objectMemory isImmediate: _gsSqueakTemp_thisReceiver)
			or: [argumentCount > 0
					and: [objectMemory isForwarded: _gsSqueakTemp_thisReceiver]])
		ifTrue: [self primitiveFail]
		ifFalse: [self
				pop: argumentCount + 1
				thenPushInteger: (objectMemory hashBitsOf: _gsSqueakTemp_thisReceiver)]