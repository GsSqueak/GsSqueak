primitives-other
primitiveFinishedProcessing
	| _gsSqueakTemp_finished _gsSqueakTemp_failureCode |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_finished := self finishedProcessing.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1.
	interpreterProxy pushBool: _gsSqueakTemp_finished.
	doProfileStats
		ifTrue: [self incrementStat: GWCountFinishTest by: 1.
			self incrementStat: GWTimeFinishTest by: interpreterProxy ioMicroMSecs - geProfileTime]