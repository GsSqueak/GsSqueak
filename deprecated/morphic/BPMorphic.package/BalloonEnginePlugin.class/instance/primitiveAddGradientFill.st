primitives
primitiveAddGradientFill
	| _gsSqueakTemp_failureCode _gsSqueakTemp_isRadial _gsSqueakTemp_nrmOop _gsSqueakTemp_dirOop _gsSqueakTemp_originOop _gsSqueakTemp_rampOop _gsSqueakTemp_fill |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 5
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_isRadial := interpreterProxy
				booleanValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_nrmOop := interpreterProxy stackValue: 1.
	_gsSqueakTemp_dirOop := interpreterProxy stackValue: 2.
	_gsSqueakTemp_originOop := interpreterProxy stackValue: 3.
	_gsSqueakTemp_rampOop := interpreterProxy stackValue: 4.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 5)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	self loadPoint: self point1Get from: _gsSqueakTemp_originOop.
	self loadPoint: self point2Get from: _gsSqueakTemp_dirOop.
	self loadPoint: self point3Get from: _gsSqueakTemp_nrmOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFBadPoint].
	_gsSqueakTemp_fill := self
				loadGradientFill: _gsSqueakTemp_rampOop
				from: self point1Get
				along: self point2Get
				normal: self point3Get
				isRadial: _gsSqueakTemp_isRadial.
	engineStopped
		ifTrue: ["Make sure the stack is okay"
			^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self storeEngineStateInto: engine.
	interpreterProxy
		pop: 6
		thenPush: (interpreterProxy positive32BitIntegerFor: _gsSqueakTemp_fill)