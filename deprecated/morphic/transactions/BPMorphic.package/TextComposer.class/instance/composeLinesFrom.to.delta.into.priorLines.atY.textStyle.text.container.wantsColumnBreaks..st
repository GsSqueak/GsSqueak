as yet unclassified
composeLinesFrom: argStart to: argStop delta: argDelta into: argLinesCollection priorLines: argPriorLines atY: argStartY textStyle: argTextStyle text: argText container: argContainer wantsColumnBreaks: argWantsColumnBreaks 
	wantsColumnBreaks := argWantsColumnBreaks.
	lines := argLinesCollection.
	theTextStyle := argTextStyle.
	theText := argText.
	theContainer := argContainer.
	deltaCharIndex := argDelta.
	currCharIndex := startCharIndex := argStart.
	stopCharIndex := argStop.
	prevLines := argPriorLines.
	currentY := argStartY.
	maxRightX := theContainer left.
	possibleSlide := stopCharIndex < theText size
				and: [theContainer isMemberOf: Rectangle].
	nowSliding := false.
	prevIndex := 1.
	"choose an appropriate scanner - should go away soon, when they can
	be unified"
	scanner := CompositionScanner new.
	scanner text: theText textStyle: theTextStyle.
	scanner wantsColumnBreaks: wantsColumnBreaks.
	defaultLineHeight := scanner computeDefaultLineHeight.
	isFirstLine := true.
	self composeAllLines.
	isFirstLine
		ifTrue: ["No space in container or empty text"
			self
				addNullLineWithIndex: startCharIndex
				andRectangle: (theContainer left @ theContainer top extent: 0 @ defaultLineHeight)]
		ifFalse: [(lines last last = theText size
					and: [scanner doesTheLineBreaksAfterLastChar])
				ifTrue: [self addNullLineForIndex: theText size + 1]].
	^ {lines asArray. maxRightX}