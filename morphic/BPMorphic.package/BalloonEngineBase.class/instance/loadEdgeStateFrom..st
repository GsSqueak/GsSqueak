loading state
loadEdgeStateFrom: edgeOop 
	| _gsSqueakTemp_edge |
	_gsSqueakTemp_edge := self lastExportedEdgeGet.
	(interpreterProxy slotSizeOf: edgeOop)
			< ETBalloonEdgeDataSize
		ifTrue: [^ nil].
	self
		edgeXValueOf: _gsSqueakTemp_edge
		put: (interpreterProxy fetchInteger: ETXValueIndex ofObject: edgeOop).
	self
		edgeYValueOf: _gsSqueakTemp_edge
		put: (interpreterProxy fetchInteger: ETYValueIndex ofObject: edgeOop).
	self
		edgeZValueOf: _gsSqueakTemp_edge
		put: (interpreterProxy fetchInteger: ETZValueIndex ofObject: edgeOop).
	self
		edgeNumLinesOf: _gsSqueakTemp_edge
		put: (interpreterProxy fetchInteger: ETLinesIndex ofObject: edgeOop).
	^ _gsSqueakTemp_edge