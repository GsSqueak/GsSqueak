scanning
displayLine: textLine offset: offset leftInRun: leftInRun 
	"The call on the primitive (scanCharactersFrom:to:in:rightX:) will be
	interrupted according to an array of stop conditions passed to the
	scanner at which time the code to handle the stop condition is run
	and the call on the primitive continued until a stop condition returns
	true (which means the line has terminated). leftInRun is the # of
	characters left to scan in the current run; when 0, it is time to call
	setStopConditions. "
	| _gsSqueakTemp_stopCondition _gsSqueakTemp_nowLeftInRun _gsSqueakTemp_startIndex _gsSqueakTemp_string _gsSqueakTemp_lastPos _gsSqueakTemp_lineHeight _gsSqueakTemp_stop |
	line := textLine.
	morphicOffset := offset.
	lineY := line top + offset y.
	_gsSqueakTemp_lineHeight := line lineHeight.
	rightMargin := line rightMargin + offset x.
	lastIndex := line first.
	leftInRun <= 0
		ifTrue: [self setStopConditions].
	leftMargin := (line leftMarginForAlignment: alignment)
				+ offset x.
	destX := leftMargin.
	self fillTextBackground.
	lastDisplayableIndex := lastIndex := line first.
	leftInRun <= 0
		ifTrue: [_gsSqueakTemp_nowLeftInRun := text runLengthFor: lastIndex]
		ifFalse: [_gsSqueakTemp_nowLeftInRun := leftInRun].
	destY := lineY + line baseline - font ascent.
	runStopIndex := lastIndex + (_gsSqueakTemp_nowLeftInRun - 1) min: line last.
	spaceCount := 0.
	_gsSqueakTemp_string := text string.
	["reset the stopping conditions of this displaying loop, and also the font."
	stopConditionsMustBeReset
		ifTrue: [self setStopConditions].
	"remember where this portion of the line starts"
	_gsSqueakTemp_startIndex := lastIndex.
	_gsSqueakTemp_lastPos := destX @ destY.
	"find the end of this portion of the line"
	_gsSqueakTemp_stopCondition := self
				scanCharactersFrom: lastIndex
				to: runStopIndex
				in: _gsSqueakTemp_string
				rightX: rightMargin.
	"handle the stop condition - this will also set lastDisplayableIndex"
	_gsSqueakTemp_stop := self perform: _gsSqueakTemp_stopCondition.
	"display that portion of the line"
	lastDisplayableIndex >= _gsSqueakTemp_startIndex
		ifTrue: [self
				displayString: _gsSqueakTemp_string
				from: _gsSqueakTemp_startIndex
				to: lastDisplayableIndex
				at: _gsSqueakTemp_lastPos].
	"if the stop condition were true, stop the loop"
	_gsSqueakTemp_stop] whileFalse.
	^ runStopIndex - lastIndex"Number of characters remaining in the current run"