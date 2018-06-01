primitives-access
primitiveGetTimes
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
							>= 9]])
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_stats := interpreterProxy firstIndexableField: _gsSqueakTemp_statOop.
	_gsSqueakTemp_stats at: 0 put: (_gsSqueakTemp_stats at: 0)
			+ (workBuffer at: GWTimeInitializing).
	_gsSqueakTemp_stats at: 1 put: (_gsSqueakTemp_stats at: 1)
			+ (workBuffer at: GWTimeFinishTest).
	_gsSqueakTemp_stats at: 2 put: (_gsSqueakTemp_stats at: 2)
			+ (workBuffer at: GWTimeNextGETEntry).
	_gsSqueakTemp_stats at: 3 put: (_gsSqueakTemp_stats at: 3)
			+ (workBuffer at: GWTimeAddAETEntry).
	_gsSqueakTemp_stats at: 4 put: (_gsSqueakTemp_stats at: 4)
			+ (workBuffer at: GWTimeNextFillEntry).
	_gsSqueakTemp_stats at: 5 put: (_gsSqueakTemp_stats at: 5)
			+ (workBuffer at: GWTimeMergeFill).
	_gsSqueakTemp_stats at: 6 put: (_gsSqueakTemp_stats at: 6)
			+ (workBuffer at: GWTimeDisplaySpan).
	_gsSqueakTemp_stats at: 7 put: (_gsSqueakTemp_stats at: 7)
			+ (workBuffer at: GWTimeNextAETEntry).
	_gsSqueakTemp_stats at: 8 put: (_gsSqueakTemp_stats at: 8)
			+ (workBuffer at: GWTimeChangeAETEntry).
	interpreterProxy pop: 1