primitives-access
primitiveSetOffset
	| _gsSqueakTemp_failureCode _gsSqueakTemp_pointOop |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_pointOop := interpreterProxy stackValue: 0.
	(interpreterProxy fetchClassOf: _gsSqueakTemp_pointOop)
			= interpreterProxy classPoint
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self loadPoint: self point1Get from: _gsSqueakTemp_pointOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self
		destOffsetXPut: (self point1Get at: 0).
	self
		destOffsetYPut: (self point1Get at: 1).
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1