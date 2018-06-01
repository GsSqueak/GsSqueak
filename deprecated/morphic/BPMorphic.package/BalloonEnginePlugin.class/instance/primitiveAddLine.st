primitives
primitiveAddLine
	| _gsSqueakTemp_failureCode _gsSqueakTemp_leftFill _gsSqueakTemp_rightFill _gsSqueakTemp_endOop _gsSqueakTemp_startOop |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 4
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_rightFill := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_leftFill := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 1).
	_gsSqueakTemp_endOop := interpreterProxy stackObjectValue: 2.
	_gsSqueakTemp_startOop := interpreterProxy stackObjectValue: 3.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 4)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Make sure the fills are okay"
	((self isFillOkay: _gsSqueakTemp_leftFill)
			and: [self isFillOkay: _gsSqueakTemp_rightFill])
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	"Load the points"
	self loadPoint: self point1Get from: _gsSqueakTemp_startOop.
	self loadPoint: self point2Get from: _gsSqueakTemp_endOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFBadPoint].
	"Transform points"
	self transformPoints: 2.
	"Transform colors"
	_gsSqueakTemp_leftFill := self transformColor: _gsSqueakTemp_leftFill.
	_gsSqueakTemp_rightFill := self transformColor: _gsSqueakTemp_rightFill.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	"Load line"
	self
		loadWideLine: 0
		from: self point1Get
		to: self point2Get
		lineFill: 0
		leftFill: _gsSqueakTemp_leftFill
		rightFill: _gsSqueakTemp_rightFill.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 4