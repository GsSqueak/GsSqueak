primitives-rendering
loadRenderingState
	"Load the entire state from the interpreter for the rendering primitives.
	Answer 0 on success or a non-zero failure code on failure."
	| _gsSqueakTemp_failCode _gsSqueakTemp_edgeOop _gsSqueakTemp_fillOop _gsSqueakTemp_state |
	interpreterProxy methodArgumentCount = 2
		ifFalse: [^ PrimErrBadNumArgs].
	(_gsSqueakTemp_failCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 2)) ~= 0
		ifTrue: [^ _gsSqueakTemp_failCode].
	_gsSqueakTemp_fillOop := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_edgeOop := interpreterProxy stackObjectValue: 1.
	interpreterProxy failed
		ifTrue: [^ PrimErrBadArgument].
	"Load span buffer and bitBlt"
	(_gsSqueakTemp_failCode := self
					loadSpanBufferFrom: (interpreterProxy fetchPointer: BESpanIndex ofObject: engine)) = 0
		ifFalse: [^ _gsSqueakTemp_failCode].
	(self
			loadBitBltFrom: (interpreterProxy fetchPointer: BEBitBltIndex ofObject: engine))
		ifFalse: [^ GEFBitBltLoadFailed].
	(self
			loadFormsFrom: (interpreterProxy fetchPointer: BEFormsIndex ofObject: engine))
		ifFalse: [^ GEFFormLoadFailed].
	"Check edgeOop and fillOop"
	(interpreterProxy slotSizeOf: _gsSqueakTemp_edgeOop)
			< ETBalloonEdgeDataSize
		ifTrue: [^ GEFEdgeDataTooSmall].
	(interpreterProxy slotSizeOf: _gsSqueakTemp_fillOop)
			< FTBalloonFillDataSize
		ifTrue: [^ GEFFillDataTooSmall].
	"Note: Rendering can only take place if we're not in one of the
	intermediate (e.g., external) states."
	_gsSqueakTemp_state := self stateGet.
	(_gsSqueakTemp_state = GEStateWaitingForEdge
			or: [_gsSqueakTemp_state = GEStateWaitingForFill
					or: [_gsSqueakTemp_state = GEStateWaitingChange]])
		ifTrue: [^ GEFWrongState].
	^ 0