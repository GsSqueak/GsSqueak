primitives-incremental
primitiveInitializeProcessing
	"Note: No need to load bitBlt but must load spanBuffer"
	| _gsSqueakTemp_failureCode |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"Load span buffer for clear operation"
	(_gsSqueakTemp_failureCode := self
					loadSpanBufferFrom: (interpreterProxy fetchPointer: BESpanIndex ofObject: engine)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	self initializeGETProcessing.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	self statePut: GEStateAddingFromGET.
	"Initialized"
	interpreterProxy failed
		ifFalse: [self storeEngineStateInto: engine].
	doProfileStats
		ifTrue: [self incrementStat: GWCountInitializing by: 1.
			self incrementStat: GWTimeInitializing by: interpreterProxy ioMicroMSecs - geProfileTime]