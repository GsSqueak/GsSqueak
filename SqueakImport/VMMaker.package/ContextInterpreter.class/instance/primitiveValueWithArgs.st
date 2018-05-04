control primitives
primitiveValueWithArgs
	| argumentArray blockContext blockArgumentCount arrayArgumentCount initialIP |
	argumentArray := self popStack.
	blockContext := self popStack.
	blockArgumentCount := self argumentCountOfBlock: blockContext.
	"If the argArray isnt actually an Array we ahve to unpop the above two"
	(objectMemory isArray: argumentArray) ifFalse: [self unPop:2. ^self primitiveFail].

	self successful ifTrue: [arrayArgumentCount := objectMemory fetchWordLengthOf: argumentArray.
			self success: (arrayArgumentCount = blockArgumentCount
						and: [(objectMemory fetchPointer: CallerIndex ofObject: blockContext) = objectMemory getNilObj])].
	self successful
		ifTrue: [self
				transfer: arrayArgumentCount
				fromIndex: 0
				ofObject: argumentArray
				toIndex: TempFrameStart
				ofObject: blockContext.
			"Assume: The call to transfer:... makes blockContext a root if necessary, 
			allowing use to use unchecked stored in the following code. "
			initialIP := objectMemory fetchPointer: InitialIPIndex ofObject: blockContext.
			objectMemory
				storePointerUnchecked: InstructionPointerIndex
				ofObject: blockContext
				withValue: initialIP.
			self storeStackPointerValue: arrayArgumentCount inContext: blockContext.
			objectMemory
				storePointerUnchecked: CallerIndex
				ofObject: blockContext
				withValue: activeContext.
			self newActiveContext: blockContext]
		ifFalse: [self unPop: 2]