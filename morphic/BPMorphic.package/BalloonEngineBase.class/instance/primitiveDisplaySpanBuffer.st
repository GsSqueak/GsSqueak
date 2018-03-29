primitives-incremental
primitiveDisplaySpanBuffer
	"Note: Must load bitBlt and spanBuffer"
	| _gsSqueakTemp_failureCode |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)
					requiredState: GEStateBlitBuffer) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Load span buffer and bitBlt"
	(_gsSqueakTemp_failureCode := self
					loadSpanBufferFrom: (interpreterProxy fetchPointer: BESpanIndex ofObject: engine)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	(self
			loadBitBltFrom: (interpreterProxy fetchPointer: BEBitBltIndex ofObject: engine))
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFBitBltLoadFailed].
	(self currentYGet bitAnd: self aaScanMaskGet)
			= self aaScanMaskGet
		ifTrue: [self displaySpanBufferAt: self currentYGet.
			self postDisplayAction].
	self finishedProcessing
		ifFalse: [self aetStartPut: 0.
			self currentYPut: self currentYGet + 1.
			self statePut: GEStateUpdateEdges].
	self storeEngineStateInto: engine.
	doProfileStats
		ifTrue: [self incrementStat: GWCountDisplaySpan by: 1.
			self incrementStat: GWTimeDisplaySpan by: interpreterProxy ioMicroMSecs - geProfileTime]