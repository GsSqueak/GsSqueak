beziers-wide
stepToFirstWideBezierIn: bezier at: yValue 
	"Initialize the bezier at yValue"
	| _gsSqueakTemp_lineWidth _gsSqueakTemp_startY _gsSqueakTemp_nLines _gsSqueakTemp_yEntry _gsSqueakTemp_yExit _gsSqueakTemp_lineOffset _gsSqueakTemp_endX _gsSqueakTemp_xDir |
	"Get some values"
	_gsSqueakTemp_lineWidth := self wideBezierExtentOf: bezier.
	_gsSqueakTemp_lineOffset := self offsetFromWidth: _gsSqueakTemp_lineWidth.
	"Compute the incremental values of the bezier"
	_gsSqueakTemp_endX := self bezierEndXOf: bezier.
	_gsSqueakTemp_startY := self edgeYValueOf: bezier.
	self stepToFirstBezierIn: bezier at: _gsSqueakTemp_startY.
	_gsSqueakTemp_nLines := self edgeNumLinesOf: bezier.
	"Copy the incremental update data"
	0
		to: 5
		do: [:i | (self wideBezierUpdateDataOf: bezier)
				at: i
				put: ((self bezierUpdateDataOf: bezier)
						at: i)].
	"Compute primary x direction of curve (e.g., 1: left to right; -1: right to
	left). "
	_gsSqueakTemp_xDir := (self bezierUpdateDataOf: bezier)
				at: GBUpdateDX.
	_gsSqueakTemp_xDir = 0
		ifTrue: [_gsSqueakTemp_xDir := (self bezierUpdateDataOf: bezier)
						at: GBUpdateDDX].
	_gsSqueakTemp_xDir >= 0
		ifTrue: [_gsSqueakTemp_xDir := 1]
		ifFalse: [_gsSqueakTemp_xDir := -1].
	"Adjust the curve to start/end at the right position"
	_gsSqueakTemp_xDir < 0
		ifTrue: [self
				adjustWideBezierLeft: bezier
				width: _gsSqueakTemp_lineWidth
				offset: _gsSqueakTemp_lineOffset
				endX: _gsSqueakTemp_endX]
		ifFalse: [self
				adjustWideBezierRight: bezier
				width: _gsSqueakTemp_lineWidth
				offset: _gsSqueakTemp_lineOffset
				endX: _gsSqueakTemp_endX].
	"Adjust the last value for horizontal lines"
	_gsSqueakTemp_nLines = 0
		ifTrue: [(self bezierUpdateDataOf: bezier)
				at: GBUpdateX
				put: (self bezierFinalXOf: bezier)
						* 256].
	"Adjust the number of lines to include the lineWidth"
	self edgeNumLinesOf: bezier put: _gsSqueakTemp_nLines + _gsSqueakTemp_lineWidth.
	"Compute the points where we have to turn on/off the fills"
	_gsSqueakTemp_yEntry := 0.
	"turned on at lineOffset"
	_gsSqueakTemp_yExit := 0 - _gsSqueakTemp_nLines - _gsSqueakTemp_lineOffset.
	"turned off at zero"
	self wideBezierEntryOf: bezier put: _gsSqueakTemp_yEntry.
	self wideBezierExitOf: bezier put: _gsSqueakTemp_yExit.
	"Turn the fills on/off as necessary"
	(_gsSqueakTemp_yEntry >= _gsSqueakTemp_lineOffset
			and: [_gsSqueakTemp_yExit < 0])
		ifTrue: [self edgeFillsValidate: bezier]
		ifFalse: [self edgeFillsInvalidate: bezier].
	self computeFinalWideBezierValues: bezier width: _gsSqueakTemp_lineWidth.
	"And step to the first scan line"
	_gsSqueakTemp_startY = yValue
		ifFalse: ["Note: Must single step here so that entry/exit works"
			_gsSqueakTemp_startY
				to: yValue - 1
				do: [:i | self stepToNextWideBezierIn: bezier at: i].
			"Adjust number of lines remaining"
			self edgeNumLinesOf: bezier put: (self edgeNumLinesOf: bezier)
					- (yValue - _gsSqueakTemp_startY)]