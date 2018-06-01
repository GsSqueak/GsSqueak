primitives-other
primitiveAbortProcessing
	| _gsSqueakTemp_failureCode |
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	self statePut: GEStateCompleted.
	self storeEngineStateInto: engine