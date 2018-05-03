object access primitives
primitiveIdentityHash
	| thisReceiver |
	thisReceiver := self stackTop.
	(objectMemory isIntegerObject: thisReceiver)
		ifTrue: [self primitiveFail]
		ifFalse: [self pop:1 thenPushInteger: (objectMemory hashBitsOf: thisReceiver)]