storing state
storeStopStateIntoEdge: edgeOop fill: fillOop 
	| _gsSqueakTemp_reason _gsSqueakTemp_edge |
	_gsSqueakTemp_reason := self stopReasonGet.
	_gsSqueakTemp_reason = GErrorGETEntry
		ifTrue: [_gsSqueakTemp_edge := getBuffer at: self getStartGet.
			self storeEdgeStateFrom: _gsSqueakTemp_edge into: edgeOop.
			self getStartPut: self getStartGet + 1].
	_gsSqueakTemp_reason = GErrorFillEntry
		ifTrue: [self storeFillStateInto: fillOop].
	_gsSqueakTemp_reason = GErrorAETEntry
		ifTrue: [_gsSqueakTemp_edge := aetBuffer at: self aetStartGet.
			self storeEdgeStateFrom: _gsSqueakTemp_edge into: edgeOop]