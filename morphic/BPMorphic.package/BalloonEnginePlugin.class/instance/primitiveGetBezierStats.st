primitives
primitiveGetBezierStats
	| _gsSqueakTemp_failureCode _gsSqueakTemp_statOop _gsSqueakTemp_stats |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_statOop := interpreterProxy stackObjectValue: 0.
	(interpreterProxy failed not
			and: [(interpreterProxy isWords: _gsSqueakTemp_statOop)
					and: [(interpreterProxy slotSizeOf: _gsSqueakTemp_statOop)
							>= 4]])
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_stats := interpreterProxy firstIndexableField: _gsSqueakTemp_statOop.
	_gsSqueakTemp_stats at: 0 put: (_gsSqueakTemp_stats at: 0)
			+ (workBuffer at: GWBezierMonotonSubdivisions).
	_gsSqueakTemp_stats at: 1 put: (_gsSqueakTemp_stats at: 1)
			+ (workBuffer at: GWBezierHeightSubdivisions).
	_gsSqueakTemp_stats at: 2 put: (_gsSqueakTemp_stats at: 2)
			+ (workBuffer at: GWBezierOverflowSubdivisions).
	_gsSqueakTemp_stats at: 3 put: (_gsSqueakTemp_stats at: 3)
			+ (workBuffer at: GWBezierLineConversions).
	interpreterProxy pop: 1