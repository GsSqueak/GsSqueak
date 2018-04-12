copying
copyLoop
	"This is the basic rendering loop using as little primitive support as
	possible. "
	| _gsSqueakTemp_finished _gsSqueakTemp_edge _gsSqueakTemp_fill |
	_gsSqueakTemp_edge := BalloonEdgeData new.
	_gsSqueakTemp_fill := BalloonFillData new.
	self primInitializeProcessing.
	"Initialize the GE for processing"
	[self primFinishedProcessing]
		whileFalse: ["Step 1: Process the edges in the global edge table that will be
			added in this step"
			[_gsSqueakTemp_finished := self primNextGlobalEdgeEntryInto: _gsSqueakTemp_edge.
			_gsSqueakTemp_finished]
				whileFalse: [_gsSqueakTemp_edge
						source: (externals at: _gsSqueakTemp_edge index).
					_gsSqueakTemp_edge stepToFirstScanLine.
					self primAddActiveEdgeTableEntryFrom: _gsSqueakTemp_edge].
			"Step 2: Scan the active edge table"
			[_gsSqueakTemp_finished := self primNextFillEntryInto: _gsSqueakTemp_fill.
			_gsSqueakTemp_finished]
				whileFalse: [_gsSqueakTemp_fill
						source: (externals at: _gsSqueakTemp_fill index).
					"Compute the new fill"
					_gsSqueakTemp_fill computeFill.
					"And mix it in the out buffer"
					self primMergeFill: _gsSqueakTemp_fill destForm bits from: _gsSqueakTemp_fill].
			"Step 3: Display the current span buffer if necessary"
			self primDisplaySpanBuffer.
			"Step 4: Advance and resort the active edge table"
			[_gsSqueakTemp_finished := self primNextActiveEdgeEntryInto: _gsSqueakTemp_edge.
			_gsSqueakTemp_finished]
				whileFalse: ["If the index is zero then the edge has been handled
					by the GE"
					_gsSqueakTemp_edge
						source: (externals at: _gsSqueakTemp_edge index).
					_gsSqueakTemp_edge stepToNextScanLine.
					self primChangeActiveEdgeTableEntryFrom: _gsSqueakTemp_edge]].
	self primGetTimes: Times.
	self primGetCounts: Counts.
	self primGetBezierStats: BezierStats