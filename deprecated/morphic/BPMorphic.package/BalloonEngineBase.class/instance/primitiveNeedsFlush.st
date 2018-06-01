primitives-access
primitiveNeedsFlush
	| _gsSqueakTemp_failureCode _gsSqueakTemp_needFlush |
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_needFlush := self needsFlush.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1.
	interpreterProxy pushBool: _gsSqueakTemp_needFlush