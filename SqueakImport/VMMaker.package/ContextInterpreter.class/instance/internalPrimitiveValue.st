control primitives
internalPrimitiveValue
	| newContext blockArgumentCount initialIP |
	<inline: true>
	self sharedCodeNamed: 'commonPrimitiveValue' inCase: 201.
	self initPrimCall.
	newContext := self internalStackValue: argumentCount.
	self assertClassOf: newContext is: (objectMemory splObj: ClassBlockContext).
	blockArgumentCount := self argumentCountOfBlock: newContext.

	self success: (argumentCount = blockArgumentCount and: [(objectMemory fetchPointer: CallerIndex ofObject: newContext) = objectMemory getNilObj]).

	self successful
		ifTrue: ["This code assumes argCount can only = 0 or 1"
			argumentCount = 1
				ifTrue: [objectMemory storePointer: TempFrameStart ofObject: newContext withValue: self internalStackTop].
			self internalPop: argumentCount + 1.
			"copy the initialIP value to the ip slot"
			initialIP := objectMemory fetchPointer: InitialIPIndex ofObject: newContext.
			objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: newContext withValue: initialIP.
			self storeStackPointerValue: argumentCount inContext: newContext.
			objectMemory storePointerUnchecked: CallerIndex ofObject: newContext withValue: activeContext.
			self internalNewActiveContext: newContext]
		ifFalse: [messageSelector := self specialSelector: 25 + argumentCount.
			self normalSend]