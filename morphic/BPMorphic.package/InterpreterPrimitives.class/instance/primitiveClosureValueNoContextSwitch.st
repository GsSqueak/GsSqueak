control primitives
primitiveClosureValueNoContextSwitch
	"An exact clone of primitiveClosureValue except that this version will
	not check for interrupts on stack overflow. It may invoke the garbage
	collector but will not switch processes. See
	checkForInterruptsMayContextSwitch: "
	| _gsSqueakTemp_blockClosure _gsSqueakTemp_numArgs _gsSqueakTemp_closureMethod _gsSqueakTemp_outerContext |
	_gsSqueakTemp_blockClosure := self stackValue: argumentCount.
	_gsSqueakTemp_numArgs := self argumentCountOfClosure: _gsSqueakTemp_blockClosure.
	argumentCount = _gsSqueakTemp_numArgs
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
	self
		activateNewClosure: _gsSqueakTemp_blockClosure
		outer: _gsSqueakTemp_outerContext
		method: _gsSqueakTemp_closureMethod
		numArgs: _gsSqueakTemp_numArgs
		mayContextSwitch: false