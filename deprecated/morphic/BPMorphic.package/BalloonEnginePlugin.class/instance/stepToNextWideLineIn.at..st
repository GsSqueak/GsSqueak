lines-wide
stepToNextWideLineIn: line at: yValue 
	"Incrementally step to the next scan line in the given wide line"
	| _gsSqueakTemp_yEntry _gsSqueakTemp_yExit _gsSqueakTemp_lineWidth _gsSqueakTemp_lineOffset _gsSqueakTemp_lastX _gsSqueakTemp_nextX |
	"Adjust entry/exit values"
	_gsSqueakTemp_yEntry := (self wideLineEntryOf: line)
				+ 1.
	_gsSqueakTemp_yExit := (self wideLineExitOf: line)
				+ 1.
	self wideLineEntryOf: line put: _gsSqueakTemp_yEntry.
	self wideLineExitOf: line put: _gsSqueakTemp_yExit.
	"Turn fills on/off"
	_gsSqueakTemp_lineWidth := self wideLineExtentOf: line.
	_gsSqueakTemp_lineOffset := self offsetFromWidth: _gsSqueakTemp_lineWidth.
	_gsSqueakTemp_yEntry >= _gsSqueakTemp_lineOffset
		ifTrue: [self edgeFillsValidate: line].
	_gsSqueakTemp_yExit >= 0
		ifTrue: [self edgeFillsInvalidate: line].
	"Step to the next scan line"
	_gsSqueakTemp_lastX := self edgeXValueOf: line.
	self stepToNextLineIn: line at: yValue.
	_gsSqueakTemp_nextX := self edgeXValueOf: line.
	"Check for special start/end adjustments"
	(_gsSqueakTemp_yEntry <= _gsSqueakTemp_lineWidth
			or: [_gsSqueakTemp_yExit + _gsSqueakTemp_lineOffset >= 0])
		ifTrue: ["Yes, need an update"
			self
				adjustWideLine: line
				afterSteppingFrom: _gsSqueakTemp_lastX
				to: _gsSqueakTemp_nextX]