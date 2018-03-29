control primitives
primitiveClosureValueWithArgs
	| _gsSqueakTemp_argumentArray _gsSqueakTemp_arraySize _gsSqueakTemp_blockClosure _gsSqueakTemp_numArgs _gsSqueakTemp_closureMethod _gsSqueakTemp_index _gsSqueakTemp_outerContext |
	_gsSqueakTemp_argumentArray := self stackTop.
	(objectMemory isArray: _gsSqueakTemp_argumentArray)
		ifFalse: [^ self primitiveFail].
	"Check for enough space in thisContext to push all args"
	_gsSqueakTemp_arraySize := objectMemory numSlotsOf: _gsSqueakTemp_argumentArray.
	(self roomToPushNArgs: _gsSqueakTemp_arraySize)
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_blockClosure := self stackValue: argumentCount.
	_gsSqueakTemp_numArgs := self argumentCountOfClosure: _gsSqueakTemp_blockClosure.
	_gsSqueakTemp_arraySize = _gsSqueakTemp_numArgs
		ifFalse: [^ self primitiveFail].
	"Somewhat paranoiac checks we need while debugging that we may
	be able to discard
	in a robust system."
	_gsSqueakTemp_outerContext := objectMemory fetchPointer: ClosureOuterContextIndex ofObject: _gsSqueakTemp_blockClosure.
	(objectMemory isContext: _gsSqueakTemp_outerContext)
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_closureMethod := objectMemory fetchPointer: MethodIndex ofObject: _gsSqueakTemp_outerContext.
	"Check if the closure's method is actually a CompiledMethod."
	(objectMemory isOopCompiledMethod: _gsSqueakTemp_closureMethod)
		ifFalse: [^ self primitiveFail].
	self popStack.
	"Copy the arguments to the stack, and activate"
	_gsSqueakTemp_index := 1.
	[_gsSqueakTemp_index <= _gsSqueakTemp_numArgs]
		whileTrue: [self
				push: (objectMemory fetchPointer: _gsSqueakTemp_index - 1 ofObject: _gsSqueakTemp_argumentArray).
			_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
	self
		activateNewClosure: _gsSqueakTemp_blockClosure
		outer: _gsSqueakTemp_outerContext
		method: _gsSqueakTemp_closureMethod
		numArgs: _gsSqueakTemp_numArgs
		mayContextSwitch: true