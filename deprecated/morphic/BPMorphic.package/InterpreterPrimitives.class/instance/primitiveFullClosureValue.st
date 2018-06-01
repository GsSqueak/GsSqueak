control primitives
primitiveFullClosureValue
	| _gsSqueakTemp_blockClosure _gsSqueakTemp_numArgs _gsSqueakTemp_closureMethod |
	_gsSqueakTemp_blockClosure := self stackValue: argumentCount.
	_gsSqueakTemp_numArgs := self argumentCountOfClosure: _gsSqueakTemp_blockClosure.
	argumentCount = _gsSqueakTemp_numArgs
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_closureMethod := objectMemory fetchPointer: FullClosureCompiledBlockIndex ofObject: _gsSqueakTemp_blockClosure.
	(objectMemory isOopCompiledMethod: _gsSqueakTemp_closureMethod)
		ifFalse: [^ self primitiveFail].
	self
		activateNewFullClosure: _gsSqueakTemp_blockClosure
		method: _gsSqueakTemp_closureMethod
		numArgs: _gsSqueakTemp_numArgs
		mayContextSwitch: true