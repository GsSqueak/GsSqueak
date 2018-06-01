lines-simple
stepToFirstLineIn: line at: yValue 
	"Initialize the line at yValue"
	| _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_xDir _gsSqueakTemp_widthX _gsSqueakTemp_error _gsSqueakTemp_xInc _gsSqueakTemp_errorAdjUp _gsSqueakTemp_startY |
	"Do a quick check if there is anything at all to do"
	((self isWide: line) not
			and: [yValue
					>= (self lineEndYOf: line)])
		ifTrue: [^ self edgeNumLinesOf: line put: 0].
	_gsSqueakTemp_deltaX := (self lineEndXOf: line)
				- (self edgeXValueOf: line).
	_gsSqueakTemp_deltaY := (self lineEndYOf: line)
				- (self edgeYValueOf: line).
	"Check if edge goes left to right"
	_gsSqueakTemp_deltaX >= 0
		ifTrue: [_gsSqueakTemp_xDir := 1.
			_gsSqueakTemp_widthX := _gsSqueakTemp_deltaX.
			_gsSqueakTemp_error := 0]
		ifFalse: [_gsSqueakTemp_xDir := -1.
			_gsSqueakTemp_widthX := 0 - _gsSqueakTemp_deltaX.
			_gsSqueakTemp_error := 1 - _gsSqueakTemp_deltaY].
	"Check if deltaY is zero.
	Note: We could actually get out here immediately 
	but wide lines rely on an accurate setup in this case"
	_gsSqueakTemp_deltaY = 0
		ifTrue: [_gsSqueakTemp_error := 0.
			"No error for horizontal edges"
			_gsSqueakTemp_xInc := _gsSqueakTemp_deltaX.
			"Encodes width and direction"
			_gsSqueakTemp_errorAdjUp := 0]
		ifFalse: ["Check if edge is y-major"
			_gsSqueakTemp_deltaY > _gsSqueakTemp_widthX
				ifTrue: ["Note: The '>' instead of '>=' could be important
					here... "
					_gsSqueakTemp_xInc := 0.
					_gsSqueakTemp_errorAdjUp := _gsSqueakTemp_widthX]
				ifFalse: [_gsSqueakTemp_xInc := _gsSqueakTemp_widthX // _gsSqueakTemp_deltaY * _gsSqueakTemp_xDir.
					_gsSqueakTemp_errorAdjUp := _gsSqueakTemp_widthX \\ _gsSqueakTemp_deltaY]].
	"Store the values"
	self edgeNumLinesOf: line put: _gsSqueakTemp_deltaY.
	self lineXDirectionOf: line put: _gsSqueakTemp_xDir.
	"self lineYDirectionOf: line put: yDir."
	"<-- Already set"
	self lineXIncrementOf: line put: _gsSqueakTemp_xInc.
	self lineErrorOf: line put: _gsSqueakTemp_error.
	self lineErrorAdjUpOf: line put: _gsSqueakTemp_errorAdjUp.
	self lineErrorAdjDownOf: line put: _gsSqueakTemp_deltaY.
	"And step to the first scan line"
	(_gsSqueakTemp_startY := self edgeYValueOf: line) = yValue
		ifFalse: [_gsSqueakTemp_startY
				to: yValue - 1
				do: [:i | self stepToNextLineIn: line at: i].
			"Adjust number of lines remaining"
			self edgeNumLinesOf: line put: _gsSqueakTemp_deltaY - (yValue - _gsSqueakTemp_startY)]