common selector sends
bytecodePrimValue
	| rcvr isBlock |
	rcvr := self internalStackTop.
	argumentCount := 0.
	isBlock := objectMemory
					is: rcvr
					instanceOf: (objectMemory splObj: ClassBlockClosure)
					compactClassIndex: ClassBlockClosureCompactIndex.
	isBlock ifTrue:
		[self externalizeIPandSP.
		self initPrimCall.
		self primitiveClosureValue.
		self internalizeIPandSP.
		self successful ifTrue:
			[^self fetchNextBytecode].
		primFailCode := 0].
	messageSelector := self specialSelector: 25.
	self normalSend