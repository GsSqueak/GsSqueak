copying
copyLoopFaster
	"This is a copy loop drawing one scan line at a time"
	| _gsSqueakTemp_edge _gsSqueakTemp_fill _gsSqueakTemp_reason |
	_gsSqueakTemp_edge := BalloonEdgeData new.
	_gsSqueakTemp_fill := BalloonFillData new.
	[self primFinishedProcessing]
		whileFalse: [_gsSqueakTemp_reason := self primRenderScanline: _gsSqueakTemp_edge with: _gsSqueakTemp_fill.
			"reason ~= 0 means there has been a problem"
			_gsSqueakTemp_reason = 0
				ifFalse: [self
						processStopReason: _gsSqueakTemp_reason
						edge: _gsSqueakTemp_edge
						fill: _gsSqueakTemp_fill]].
	self primGetTimes: Times.
	self primGetCounts: Counts.
	self primGetBezierStats: BezierStats