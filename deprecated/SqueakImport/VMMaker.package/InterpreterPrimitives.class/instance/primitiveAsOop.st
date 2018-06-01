object access primitives
primitiveAsOop
	| thisReceiver |
	thisReceiver := self stackTop.
	self success: (objectMemory isIntegerObject: thisReceiver) not.
	self successful
		ifTrue: [self pop:1 thenPushInteger: (objectMemory hashBitsOf: thisReceiver)]