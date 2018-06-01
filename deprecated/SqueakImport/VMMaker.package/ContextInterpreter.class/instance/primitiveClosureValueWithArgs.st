control primitives
primitiveClosureValueWithArgs
	| argumentArray arraySize cntxSize blockClosure blockArgumentCount closureMethod index outerContext |
	argumentArray := self stackTop.
	(objectMemory isArray: argumentArray) ifFalse:
		[^self primitiveFail].

	"Check for enough space in thisContext to push all args"
	arraySize := objectMemory fetchWordLengthOf: argumentArray.
	cntxSize := objectMemory fetchWordLengthOf: activeContext.
	(self stackPointerIndex + arraySize) < cntxSize ifFalse:
		[^self primitiveFail].

	blockClosure := self stackValue: argumentCount.
	blockArgumentCount := self argumentCountOfClosure: blockClosure.
	arraySize = blockArgumentCount ifFalse:
		[^self primitiveFail].

	"Somewhat paranoiac checks we need while debugging that we may be able to discard
	 in a robust system."
	outerContext := objectMemory fetchPointer: ClosureOuterContextIndex ofObject: blockClosure.
	(self isContext: outerContext) ifFalse:
		[^self primitiveFail].
	closureMethod := objectMemory fetchPointer: MethodIndex ofObject: outerContext.
	"Check if the closure's method is actually a CompiledMethod."
	(objectMemory isOopCompiledMethod: closureMethod) ifFalse:
		[^self primitiveFail].

	self popStack.

	"Copy the arguments to the stack, and activate"
	index := 1.
	[index <= arraySize]
		whileTrue:
		[self push: (objectMemory fetchPointer: index - 1 ofObject: argumentArray).
		index := index + 1].

	argumentCount := arraySize.
	self activateNewClosureMethod: blockClosure.
	self quickCheckForInterrupts