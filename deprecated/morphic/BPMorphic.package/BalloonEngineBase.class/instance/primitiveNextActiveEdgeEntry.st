primitives-incremental
primitiveNextActiveEdgeEntry
	"Note: No need to load either bitBlt or spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_edgeOop _gsSqueakTemp_hasEdge _gsSqueakTemp_edge |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateUpdateEdges
					or: GEStateCompleted) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_edgeOop := interpreterProxy stackObjectValue: 0.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_hasEdge := false.
	self stateGet = GEStateCompleted
		ifFalse: [_gsSqueakTemp_hasEdge := self findNextExternalUpdateFromAET.
			_gsSqueakTemp_hasEdge
				ifTrue: [_gsSqueakTemp_edge := aetBuffer at: self aetStartGet.
					self storeEdgeStateFrom: _gsSqueakTemp_edge into: _gsSqueakTemp_edgeOop.
					"Do not advance to the next aet entry yet"
					"self aetStartPut: self aetStartGet + 1."
					self statePut: GEStateWaitingChange]
				ifFalse: [self statePut: GEStateAddingFromGET]].
	interpreterProxy failed
		ifTrue: [^ nil].
	self storeEngineStateInto: engine.
	interpreterProxy pop: 2.
	interpreterProxy pushBool: _gsSqueakTemp_hasEdge not.
	doProfileStats
		ifTrue: [self incrementStat: GWCountNextAETEntry by: 1.
			self incrementStat: GWTimeNextAETEntry by: interpreterProxy ioMicroMSecs - geProfileTime]