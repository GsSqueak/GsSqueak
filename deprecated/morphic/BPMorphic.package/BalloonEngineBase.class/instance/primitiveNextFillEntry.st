primitives-incremental
primitiveNextFillEntry
	"Note: No need to load bitBlt but must load spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_fillOop _gsSqueakTemp_hasFill |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateScanningAET) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Load span buffer for internal handling of fills"
	(_gsSqueakTemp_failureCode := self
					loadSpanBufferFrom: (interpreterProxy fetchPointer: BESpanIndex ofObject: engine)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	(self
			loadFormsFrom: (interpreterProxy fetchPointer: BEFormsIndex ofObject: engine))
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFFormLoadFailed].
	"Check if we have to clear the span buffer before proceeding"
	self clearSpanBufferGet = 0
		ifFalse: [(self currentYGet bitAnd: self aaScanMaskGet)
					= 0
				ifTrue: [self clearSpanBuffer].
			self clearSpanBufferPut: 0].
	_gsSqueakTemp_fillOop := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_hasFill := self findNextExternalFillFromAET.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	_gsSqueakTemp_hasFill
		ifTrue: [self storeFillStateInto: _gsSqueakTemp_fillOop].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	_gsSqueakTemp_hasFill
		ifTrue: [self statePut: GEStateWaitingForFill]
		ifFalse: [self wbStackClear.
			self spanEndAAPut: 0.
			self statePut: GEStateBlitBuffer].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 2.
	interpreterProxy pushBool: _gsSqueakTemp_hasFill not.
	doProfileStats
		ifTrue: [self incrementStat: GWCountNextFillEntry by: 1.
			self incrementStat: GWTimeNextFillEntry by: interpreterProxy ioMicroMSecs - geProfileTime]