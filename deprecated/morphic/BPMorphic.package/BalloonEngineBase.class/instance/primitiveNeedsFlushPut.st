primitives-access
primitiveNeedsFlushPut
	| _gsSqueakTemp_failureCode _gsSqueakTemp_needFlush |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_needFlush := interpreterProxy
				booleanValueOf: (interpreterProxy stackValue: 0).
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_needFlush == true
		ifTrue: [self needsFlushPut: 1]
		ifFalse: [self needsFlushPut: 0].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1