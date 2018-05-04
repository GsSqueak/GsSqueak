common selector sends
bytecodePrimLessThan
	| rcvr arg aBool |
	rcvr := self internalStackValue: 1.
	arg := self internalStackValue: 0.
	(self areIntegers: rcvr and: arg) ifTrue:
		[self cCode: '' inSmalltalk: [^self booleanCheat: (objectMemory integerValueOf: rcvr) < (objectMemory integerValueOf: arg)].
		^ self booleanCheat: rcvr < arg].

	self initPrimCall.
	aBool := self primitiveFloatLess: rcvr thanArg: arg.
	self successful ifTrue: [^ self booleanCheat: aBool].

	messageSelector := self specialSelector: 2.
	argumentCount := 1.
	self normalSend
