primitives-other
primitiveRegisterExternalFill
	| _gsSqueakTemp_failureCode _gsSqueakTemp_index _gsSqueakTemp_fill |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_index := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	"Note: We *must* not allocate any fill with index 0"
	_gsSqueakTemp_fill := 0.
	[_gsSqueakTemp_fill = 0]
		whileTrue: [(self allocateObjEntry: GEBaseEdgeSize)
				ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
			_gsSqueakTemp_fill := objUsed.
			objUsed := _gsSqueakTemp_fill + GEBaseFillSize.
			"Install type and length"
			self objectTypeOf: _gsSqueakTemp_fill put: GEPrimitiveFill.
			self objectLengthOf: _gsSqueakTemp_fill put: GEBaseFillSize.
			self objectIndexOf: _gsSqueakTemp_fill put: _gsSqueakTemp_index].
	interpreterProxy failed
		ifFalse: [self storeEngineStateInto: engine.
			interpreterProxy pop: 2.
			interpreterProxy pushInteger: _gsSqueakTemp_fill]