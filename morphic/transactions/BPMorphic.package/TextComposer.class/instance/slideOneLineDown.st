as yet unclassified
slideOneLineDown
	"Having detected the end of rippling recoposition, we are only sliding
	old lines"
	| _gsSqueakTemp_priorLine |
	prevIndex < prevLines size
		ifFalse: ["There are no more prevLines to slide."
			^ nowSliding := possibleSlide := false].
	"Adjust and re-use previously composed line"
	prevIndex := prevIndex + 1.
	_gsSqueakTemp_priorLine := (prevLines at: prevIndex)
				slideIndexBy: deltaCharIndex
				andMoveTopTo: currentY.
	lines addLast: _gsSqueakTemp_priorLine.
	currentY := _gsSqueakTemp_priorLine bottom.
	currCharIndex := _gsSqueakTemp_priorLine last + 1.
	wantsColumnBreaks
		ifTrue: [_gsSqueakTemp_priorLine first
				to: _gsSqueakTemp_priorLine last
				do: [:i | (theText at: i)
							= Character characterForColumnBreak
						ifTrue: [nowSliding := possibleSlide := false.
							^ nil]]]