primitives-access
primitiveSetAALevel
	| _gsSqueakTemp_failureCode _gsSqueakTemp_level |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_level := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self setAALevel: _gsSqueakTemp_level.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1