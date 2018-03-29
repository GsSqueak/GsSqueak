primitives
primitiveAddOval
	| _gsSqueakTemp_failureCode _gsSqueakTemp_fillIndex _gsSqueakTemp_borderWidth _gsSqueakTemp_borderIndex _gsSqueakTemp_endOop _gsSqueakTemp_startOop |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 5
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_borderIndex := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_borderWidth := interpreterProxy stackIntegerValue: 1.
	_gsSqueakTemp_fillIndex := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 2).
	_gsSqueakTemp_endOop := interpreterProxy stackObjectValue: 3.
	_gsSqueakTemp_startOop := interpreterProxy stackObjectValue: 4.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 5)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Make sure the fills are okay"
	((self isFillOkay: _gsSqueakTemp_borderIndex)
			and: [self isFillOkay: _gsSqueakTemp_fillIndex])
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	"Transform colors"
	_gsSqueakTemp_fillIndex := self transformColor: _gsSqueakTemp_fillIndex.
	_gsSqueakTemp_borderIndex := self transformColor: _gsSqueakTemp_borderIndex.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	"Check if we have anything at all to do"
	(_gsSqueakTemp_fillIndex = 0
			and: [_gsSqueakTemp_borderIndex = 0
					or: [_gsSqueakTemp_borderWidth <= 0]])
		ifTrue: [^ interpreterProxy pop: 5"Leave rcvr on stack"].
	"Make sure we have some space"
	(self needAvailableSpace: 16 * GBBaseSize)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
	"Check if we need a border"
	(_gsSqueakTemp_borderWidth > 0
			and: [_gsSqueakTemp_borderIndex ~= 0])
		ifTrue: [_gsSqueakTemp_borderWidth := self transformWidth: _gsSqueakTemp_borderWidth]
		ifFalse: [_gsSqueakTemp_borderWidth := 0].
	"Load the rectangle points"
	self loadPoint: self point1Get from: _gsSqueakTemp_startOop.
	self loadPoint: self point2Get from: _gsSqueakTemp_endOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFBadPoint].
	self
		loadOval: _gsSqueakTemp_borderWidth
		lineFill: _gsSqueakTemp_borderIndex
		leftFill: 0
		rightFill: _gsSqueakTemp_fillIndex.
	engineStopped
		ifTrue: [self wbStackClear.
			^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self needsFlushPut: 1.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 5