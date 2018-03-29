primitives
primitiveAddBezier
	| _gsSqueakTemp_failureCode _gsSqueakTemp_leftFill _gsSqueakTemp_rightFill _gsSqueakTemp_viaOop _gsSqueakTemp_endOop _gsSqueakTemp_startOop _gsSqueakTemp_nSegments |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 5
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_rightFill := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_leftFill := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 1).
	_gsSqueakTemp_viaOop := interpreterProxy stackObjectValue: 2.
	_gsSqueakTemp_endOop := interpreterProxy stackObjectValue: 3.
	_gsSqueakTemp_startOop := interpreterProxy stackObjectValue: 4.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 5)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Make sure the fills are okay"
	((self isFillOkay: _gsSqueakTemp_leftFill)
			and: [self isFillOkay: _gsSqueakTemp_rightFill])
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	"Do a quick check if the fillIndices are equal - if so, just ignore it"
	_gsSqueakTemp_leftFill = _gsSqueakTemp_rightFill & false
		ifTrue: [^ interpreterProxy pop: 6"Leave rcvr on stack"].
	self loadPoint: self point1Get from: _gsSqueakTemp_startOop.
	self loadPoint: self point2Get from: _gsSqueakTemp_viaOop.
	self loadPoint: self point3Get from: _gsSqueakTemp_endOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	self transformPoints: 3.
	_gsSqueakTemp_nSegments := self
				loadAndSubdivideBezierFrom: self point1Get
				via: self point2Get
				to: self point3Get
				isWide: false.
	self needAvailableSpace: _gsSqueakTemp_nSegments * GBBaseSize.
	engineStopped
		ifFalse: [_gsSqueakTemp_leftFill := self transformColor: _gsSqueakTemp_leftFill.
			_gsSqueakTemp_rightFill := self transformColor: _gsSqueakTemp_rightFill].
	engineStopped
		ifFalse: [self
				loadWideBezier: 0
				lineFill: 0
				leftFill: _gsSqueakTemp_leftFill
				rightFill: _gsSqueakTemp_rightFill
				n: _gsSqueakTemp_nSegments].
	engineStopped
		ifTrue: ["Make sure the stack is okay"
			self wbStackClear.
			^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 5