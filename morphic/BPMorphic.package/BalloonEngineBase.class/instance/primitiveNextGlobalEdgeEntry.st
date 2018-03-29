primitives-incremental
primitiveNextGlobalEdgeEntry
	"Note: No need to load either bitBlt or spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_edgeOop _gsSqueakTemp_hasEdge _gsSqueakTemp_edge |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateAddingFromGET) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_edgeOop := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_hasEdge := self findNextExternalEntryFromGET.
	_gsSqueakTemp_hasEdge
		ifTrue: [_gsSqueakTemp_edge := getBuffer at: self getStartGet.
			self storeEdgeStateFrom: _gsSqueakTemp_edge into: _gsSqueakTemp_edgeOop.
			self getStartPut: self getStartGet + 1].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFWrongEdge].
	_gsSqueakTemp_hasEdge
		ifTrue: [self statePut: GEStateWaitingForEdge
			"Wait for adding edges"]
		ifFalse: ["Start scanning the AET"
			self statePut: GEStateScanningAET.
			self clearSpanBufferPut: 1.
			"Clear span buffer at next entry"
			self aetStartPut: 0.
			self wbStackClear].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 2.
	interpreterProxy pushBool: _gsSqueakTemp_hasEdge not.
	doProfileStats
		ifTrue: [self incrementStat: GWCountNextGETEntry by: 1.
			self incrementStat: GWTimeNextGETEntry by: interpreterProxy ioMicroMSecs - geProfileTime]