primitives-access
primitiveSetClipRect
	| _gsSqueakTemp_failureCode _gsSqueakTemp_rectOop |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_rectOop := interpreterProxy stackObjectValue: 0.
	(interpreterProxy failed not
			and: [(interpreterProxy isPointers: _gsSqueakTemp_rectOop)
					and: [(interpreterProxy slotSizeOf: _gsSqueakTemp_rectOop)
							>= 2]])
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self
		loadPoint: self point1Get
		from: (interpreterProxy fetchPointer: 0 ofObject: _gsSqueakTemp_rectOop).
	self
		loadPoint: self point2Get
		from: (interpreterProxy fetchPointer: 1 ofObject: _gsSqueakTemp_rectOop).
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self
		clipMinXPut: (self point1Get at: 0).
	self
		clipMinYPut: (self point1Get at: 1).
	self
		clipMaxXPut: (self point2Get at: 0).
	self
		clipMaxYPut: (self point2Get at: 1).
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1