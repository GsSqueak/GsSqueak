as yet unclassified
composeAllRectangles: rectangles 
	| _gsSqueakTemp_charIndexBeforeLine _gsSqueakTemp_numberOfLinesBefore _gsSqueakTemp_reasonForStopping |
	actualHeight := defaultLineHeight.
	_gsSqueakTemp_charIndexBeforeLine := currCharIndex.
	_gsSqueakTemp_numberOfLinesBefore := lines size.
	_gsSqueakTemp_reasonForStopping := self composeEachRectangleIn: rectangles.
	currentY := currentY + actualHeight.
	currentY > theContainer bottom
		ifTrue: ["Oops -- the line is really too high to fit -- back out"
			currCharIndex := _gsSqueakTemp_charIndexBeforeLine.
			lines size - _gsSqueakTemp_numberOfLinesBefore
				timesRepeat: [lines removeLast].
			^ self].
	"It's OK -- the line still fits."
	maxRightX := maxRightX max: scanner rightX.
	1
		to: rectangles size - 1
		do: [:i | 
			| lineIndex |
			"Adjust heights across rectangles if necessary"
			lineIndex := lines size - rectangles size + i.
			(lines size between: 1 and: lineIndex)
				ifTrue: [(lines at: lineIndex)
						lineHeight: lines last lineHeight
						baseline: lines last baseline]].
	isFirstLine := false.
	_gsSqueakTemp_reasonForStopping == #columnBreak
		ifTrue: [^ nil"we are finished composing"].
	currCharIndex > theText size
		ifTrue: [^ nil"we are finished composing"]