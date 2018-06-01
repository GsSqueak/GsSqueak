primitives-incremental
primitiveMergeFillFrom
	"Note: No need to load bitBlt but must load spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_fillOop _gsSqueakTemp_bitsOop _gsSqueakTemp_value |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 2
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 2)
					requiredState: GEStateWaitingForFill) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Load span buffer for merging the fill"
	(_gsSqueakTemp_failureCode := self
					loadSpanBufferFrom: (interpreterProxy fetchPointer: BESpanIndex ofObject: engine)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_fillOop := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_bitsOop := interpreterProxy stackObjectValue: 1.
	"Check bitmap"
	(interpreterProxy failed not
			and: [(interpreterProxy fetchClassOf: _gsSqueakTemp_bitsOop)
					= interpreterProxy classBitmap])
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	"Check fillOop"
	(interpreterProxy slotSizeOf: _gsSqueakTemp_fillOop)
			< FTBalloonFillDataSize
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFFillDataTooSmall].
	"Check if this was the fill we have exported"
	_gsSqueakTemp_value := interpreterProxy fetchInteger: FTIndexIndex ofObject: _gsSqueakTemp_fillOop.
	(self objectIndexOf: self lastExportedFillGet)
			= _gsSqueakTemp_value
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	_gsSqueakTemp_value := interpreterProxy fetchInteger: FTMinXIndex ofObject: _gsSqueakTemp_fillOop.
	self lastExportedLeftXGet = _gsSqueakTemp_value
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	_gsSqueakTemp_value := interpreterProxy fetchInteger: FTMaxXIndex ofObject: _gsSqueakTemp_fillOop.
	self lastExportedRightXGet = _gsSqueakTemp_value
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	(interpreterProxy slotSizeOf: _gsSqueakTemp_bitsOop)
			< (self lastExportedRightXGet - self lastExportedLeftXGet)
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	interpreterProxy failed
		ifTrue: [^ nil].
	self
		fillBitmapSpan: (interpreterProxy firstIndexableField: _gsSqueakTemp_bitsOop)
		from: self lastExportedLeftXGet
		to: self lastExportedRightXGet.
	self statePut: GEStateScanningAET.
	"Back to scanning AET"
	self storeEngineStateInto: engine.
	interpreterProxy pop: 2.
	"Leave rcvr on stack"
	doProfileStats
		ifTrue: [self incrementStat: GWCountMergeFill by: 1.
			self incrementStat: GWTimeMergeFill by: interpreterProxy ioMicroMSecs - geProfileTime]