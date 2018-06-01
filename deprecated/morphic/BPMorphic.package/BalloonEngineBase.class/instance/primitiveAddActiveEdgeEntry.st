primitives-incremental
primitiveAddActiveEdgeEntry
	"Note: No need to load either bitBlt or spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_edgeOop _gsSqueakTemp_edge |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateWaitingForEdge) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_edgeOop := interpreterProxy stackObjectValue: 0.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_edge := self loadEdgeStateFrom: _gsSqueakTemp_edgeOop.
	_gsSqueakTemp_edge = nil
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEdgeDataTooSmall].
	(self needAvailableSpace: 1)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
	(self edgeNumLinesOf: _gsSqueakTemp_edge)
			> 0
		ifTrue: [self insertEdgeIntoAET: _gsSqueakTemp_edge].
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	self statePut: GEStateAddingFromGET.
	"Back to adding edges from GET"
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1.
	"Leave rcvr on stack"
	doProfileStats
		ifTrue: [self incrementStat: GWCountAddAETEntry by: 1.
			self incrementStat: GWTimeAddAETEntry by: interpreterProxy ioMicroMSecs - geProfileTime]