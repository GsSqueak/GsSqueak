lines-wide
stepToFirstWideLineIn: line at: yValue 
	"Initialize the wide line at yValue."
	| _gsSqueakTemp_startY _gsSqueakTemp_yEntry _gsSqueakTemp_yExit _gsSqueakTemp_lineWidth _gsSqueakTemp_nLines _gsSqueakTemp_lineOffset _gsSqueakTemp_startX _gsSqueakTemp_xDir |
	"Get some values"
	_gsSqueakTemp_lineWidth := self wideLineExtentOf: line.
	_gsSqueakTemp_lineOffset := self offsetFromWidth: _gsSqueakTemp_lineWidth.
	"Compute the incremental values of the line"
	_gsSqueakTemp_startX := self edgeXValueOf: line.
	_gsSqueakTemp_startY := self edgeYValueOf: line.
	self stepToFirstLineIn: line at: _gsSqueakTemp_startY.
	_gsSqueakTemp_nLines := self edgeNumLinesOf: line.
	_gsSqueakTemp_xDir := self lineXDirectionOf: line.
	"Adjust the line to start at the correct X position"
	self edgeXValueOf: line put: _gsSqueakTemp_startX - _gsSqueakTemp_lineOffset.
	"Adjust the number of lines to include the lineWidth"
	self edgeNumLinesOf: line put: _gsSqueakTemp_nLines + _gsSqueakTemp_lineWidth.
	"Adjust the values for x-major lines"
	_gsSqueakTemp_xDir > 0
		ifTrue: [self wideLineWidthOf: line put: (self lineXIncrementOf: line)
					+ _gsSqueakTemp_lineWidth]
		ifFalse: [self wideLineWidthOf: line put: _gsSqueakTemp_lineWidth
					- (self lineXIncrementOf: line).
			"adding"
			self edgeXValueOf: line put: (self edgeXValueOf: line)
					+ (self lineXIncrementOf: line)].
	"Compute the points where we have to turn on/off the fills"
	_gsSqueakTemp_yEntry := 0.
	"turned on at lineOffset"
	_gsSqueakTemp_yExit := 0 - _gsSqueakTemp_nLines - _gsSqueakTemp_lineOffset.
	"turned off at zero"
	self wideLineEntryOf: line put: _gsSqueakTemp_yEntry.
	self wideLineExitOf: line put: _gsSqueakTemp_yExit.
	"Turn the fills on/off as necessary"
	(_gsSqueakTemp_yEntry >= _gsSqueakTemp_lineOffset
			and: [_gsSqueakTemp_yExit < 0])
		ifTrue: [self edgeFillsValidate: line]
		ifFalse: [self edgeFillsInvalidate: line].
	"And step to the first scan line"
	_gsSqueakTemp_startY = yValue
		ifFalse: [_gsSqueakTemp_startY
				to: yValue - 1
				do: [:i | self stepToNextWideLineIn: line at: i].
			"Adjust number of lines remaining"
			self edgeNumLinesOf: line put: (self edgeNumLinesOf: line)
					- (yValue - _gsSqueakTemp_startY)]