jump bytecodes
jumplfTrueBy: offset 
	| boolean |
	boolean := self internalStackTop.
	boolean = objectMemory getTrueObj
		ifTrue: [self jump: offset]
		ifFalse: [boolean = objectMemory getFalseObj
				ifFalse: [messageSelector := objectMemory splObj: SelectorMustBeBoolean.
					argumentCount := 0.
					^ self normalSend].
			self fetchNextBytecode].
	self internalPop: 1