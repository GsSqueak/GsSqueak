jump bytecodes
jumplfFalseBy: offset 
	| boolean |
	boolean := self internalStackTop.
	boolean = objectMemory getFalseObj
		ifTrue: [self jump: offset]
		ifFalse: [boolean = objectMemory getTrueObj
				ifFalse: [messageSelector := objectMemory splObj: SelectorMustBeBoolean.
					argumentCount := 0.
					^ self normalSend].
			self fetchNextBytecode].
	self internalPop: 1