primitives-other
primitiveRegisterExternalEdge
	| _gsSqueakTemp_failureCode _gsSqueakTemp_rightFillIndex _gsSqueakTemp_leftFillIndex _gsSqueakTemp_initialZ _gsSqueakTemp_initialY _gsSqueakTemp_initialX _gsSqueakTemp_index _gsSqueakTemp_edge |
	interpreterProxy methodArgumentCount = 6
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 6)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_rightFillIndex := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_leftFillIndex := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 1).
	_gsSqueakTemp_initialZ := interpreterProxy stackIntegerValue: 2.
	_gsSqueakTemp_initialY := interpreterProxy stackIntegerValue: 3.
	_gsSqueakTemp_initialX := interpreterProxy stackIntegerValue: 4.
	_gsSqueakTemp_index := interpreterProxy stackIntegerValue: 5.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(self allocateObjEntry: GEBaseEdgeSize)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
	"Make sure the fills are okay"
	((self isFillOkay: _gsSqueakTemp_leftFillIndex)
			and: [self isFillOkay: _gsSqueakTemp_rightFillIndex])
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	_gsSqueakTemp_edge := objUsed.
	objUsed := _gsSqueakTemp_edge + GEBaseEdgeSize.
	"Install type and length"
	self objectTypeOf: _gsSqueakTemp_edge put: GEPrimitiveEdge.
	self objectLengthOf: _gsSqueakTemp_edge put: GEBaseEdgeSize.
	self objectIndexOf: _gsSqueakTemp_edge put: _gsSqueakTemp_index.
	"Install remaining stuff"
	self edgeXValueOf: _gsSqueakTemp_edge put: _gsSqueakTemp_initialX.
	self edgeYValueOf: _gsSqueakTemp_edge put: _gsSqueakTemp_initialY.
	self edgeZValueOf: _gsSqueakTemp_edge put: _gsSqueakTemp_initialZ.
	self
		edgeLeftFillOf: _gsSqueakTemp_edge
		put: (self transformColor: _gsSqueakTemp_leftFillIndex).
	self
		edgeRightFillOf: _gsSqueakTemp_edge
		put: (self transformColor: _gsSqueakTemp_rightFillIndex).
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifFalse: [self storeEngineStateInto: engine.
			interpreterProxy pop: 6]