primitives
primitiveAddBitmapFill
	| _gsSqueakTemp_failureCode _gsSqueakTemp_nrmOop _gsSqueakTemp_dirOop _gsSqueakTemp_originOop _gsSqueakTemp_tileFlag _gsSqueakTemp_fill _gsSqueakTemp_xIndex _gsSqueakTemp_cmOop _gsSqueakTemp_formOop |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 7
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_xIndex := interpreterProxy stackIntegerValue: 0.
	_gsSqueakTemp_xIndex <= 0
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_nrmOop := interpreterProxy stackObjectValue: 1.
	_gsSqueakTemp_dirOop := interpreterProxy stackObjectValue: 2.
	_gsSqueakTemp_originOop := interpreterProxy stackObjectValue: 3.
	_gsSqueakTemp_tileFlag := interpreterProxy
				booleanValueOf: (interpreterProxy stackValue: 4).
	_gsSqueakTemp_cmOop := interpreterProxy stackObjectValue: 5.
	_gsSqueakTemp_formOop := interpreterProxy stackObjectValue: 6.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 7)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	self loadPoint: self point1Get from: _gsSqueakTemp_originOop.
	self loadPoint: self point2Get from: _gsSqueakTemp_dirOop.
	self loadPoint: self point3Get from: _gsSqueakTemp_nrmOop.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFBadPoint].
	_gsSqueakTemp_fill := self
				loadBitmapFill: _gsSqueakTemp_formOop
				colormap: _gsSqueakTemp_cmOop
				tile: (_gsSqueakTemp_tileFlag
						ifTrue: [1]
						ifFalse: [0])
				from: self point1Get
				along: self point2Get
				normal: self point3Get
				xIndex: _gsSqueakTemp_xIndex - 1.
	engineStopped
		ifTrue: ["Make sure the stack is okay"
			^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self storeEngineStateInto: engine.
	interpreterProxy
		pop: 8
		thenPush: (interpreterProxy positive32BitIntegerFor: _gsSqueakTemp_fill)