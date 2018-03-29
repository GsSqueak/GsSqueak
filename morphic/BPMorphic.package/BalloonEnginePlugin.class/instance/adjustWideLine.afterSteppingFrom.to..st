lines-wide
adjustWideLine: line afterSteppingFrom: lastX to: nextX 
	"Adjust the wide line after it has been stepped from lastX to nextX.
	Special adjustments of line width and start position are made here
	to simulate a rectangular brush"
	| _gsSqueakTemp_yEntry _gsSqueakTemp_yExit _gsSqueakTemp_lineWidth _gsSqueakTemp_lineOffset _gsSqueakTemp_deltaX _gsSqueakTemp_xDir _gsSqueakTemp_baseWidth |
	"Don't inline this"
	"Fetch the values the adjustment decisions are based on"
	_gsSqueakTemp_yEntry := self wideLineEntryOf: line.
	_gsSqueakTemp_yExit := self wideLineExitOf: line.
	_gsSqueakTemp_baseWidth := self wideLineExtentOf: line.
	_gsSqueakTemp_lineOffset := self offsetFromWidth: _gsSqueakTemp_baseWidth.
	_gsSqueakTemp_lineWidth := self wideLineWidthOf: line.
	_gsSqueakTemp_xDir := self lineXDirectionOf: line.
	_gsSqueakTemp_deltaX := nextX - lastX.
	"Adjust the start of the line to fill an entire rectangle"
	_gsSqueakTemp_yEntry < _gsSqueakTemp_baseWidth
		ifTrue: [_gsSqueakTemp_xDir < 0
				ifTrue: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth - _gsSqueakTemp_deltaX
					"effectively adding"]
				ifFalse: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth + _gsSqueakTemp_deltaX.
					self edgeXValueOf: line put: lastX]].
	"Adjust the end of x-major lines"
	_gsSqueakTemp_yExit + _gsSqueakTemp_lineOffset = 0
		ifTrue: [_gsSqueakTemp_xDir > 0
				ifTrue: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth
								- (self lineXIncrementOf: line)]
				ifFalse: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth
								+ (self lineXIncrementOf: line).
					"effectively subtracting"
					self edgeXValueOf: line put: lastX]].
	"Adjust the end of the line to fill an entire rectangle"
	_gsSqueakTemp_yExit + _gsSqueakTemp_lineOffset > 0
		ifTrue: [_gsSqueakTemp_xDir < 0
				ifTrue: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth + _gsSqueakTemp_deltaX.
					"effectively subtracting"
					self edgeXValueOf: line put: lastX]
				ifFalse: [_gsSqueakTemp_lineWidth := _gsSqueakTemp_lineWidth - _gsSqueakTemp_deltaX]].
	"Store the manipulated line width back"
	self wideLineWidthOf: line put: _gsSqueakTemp_lineWidth