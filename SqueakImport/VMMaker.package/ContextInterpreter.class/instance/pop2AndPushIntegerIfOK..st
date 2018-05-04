contexts
pop2AndPushIntegerIfOK: integerResult

	self successful ifTrue:
		[(objectMemory isIntegerValue: integerResult)
			ifTrue: [self pop: 2 thenPush: (objectMemory integerObjectOf: integerResult)]
			ifFalse: [self primitiveFail]]