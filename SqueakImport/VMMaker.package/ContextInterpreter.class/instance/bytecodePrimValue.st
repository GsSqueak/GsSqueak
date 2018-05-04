common selector sends
bytecodePrimValue
	"In-line value for BlockClosure and BlockContext"
	| maybeBlock rcvrClass |
	maybeBlock := self internalStackTop.
	argumentCount := 0.
	self initPrimCall.
	(objectMemory isNonIntegerObject: maybeBlock) ifTrue:
		[rcvrClass := objectMemory fetchClassOfNonInt: maybeBlock.
		 rcvrClass = (objectMemory splObj: ClassBlockClosure)
			ifTrue:
				[self externalizeIPandSP.
				 self primitiveClosureValue.
				 self internalizeIPandSP]
			ifFalse:
				[rcvrClass = (objectMemory splObj: ClassBlockContext)
					ifTrue:
						[self externalizeIPandSP.
						 self primitiveValue.
						 self internalizeIPandSP]
					ifFalse:
						[self primitiveFail]]].
	self successful ifFalse:
		[messageSelector := self specialSelector: 25.
		 ^self normalSend].
	self fetchNextBytecode