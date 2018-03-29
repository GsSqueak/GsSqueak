primitives-incremental
primitiveChangedActiveEdgeEntry
	"Note: No need to load either bitBlt or spanBuffer"
	| _gsSqueakTemp_failureCode _gsSqueakTemp_edgeOop _gsSqueakTemp_edge |
	doProfileStats
		ifTrue: [geProfileTime := interpreterProxy ioMicroMSecs].
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)
					requiredState: GEStateWaitingChange) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_edgeOop := interpreterProxy stackObjectValue: 0.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_edge := self loadEdgeStateFrom: _gsSqueakTemp_edgeOop.
	_gsSqueakTemp_edge = nil
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEdgeDataTooSmall].
	(self edgeNumLinesOf: _gsSqueakTemp_edge)
			= 0
		ifTrue: [self removeFirstAETEntry]
		ifFalse: [self resortFirstAETEntry.
			self aetStartPut: self aetStartGet + 1].
	self statePut: GEStateUpdateEdges.
	"Back to updating edges"
	self storeEngineStateInto: engine.
	interpreterProxy pop: 1.
	"Leave rcvr on stack"
	doProfileStats
		ifTrue: [self incrementStat: GWCountChangeAETEntry by: 1.
			self incrementStat: GWTimeChangeAETEntry by: interpreterProxy ioMicroMSecs - geProfileTime]