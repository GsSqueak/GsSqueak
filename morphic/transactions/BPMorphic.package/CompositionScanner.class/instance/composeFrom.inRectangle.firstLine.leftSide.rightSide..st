scanning
composeFrom: startIndex inRectangle: lineRectangle firstLine: firstLine leftSide: leftSide rightSide: rightSide 
	"Answer an instance of TextLineInterval that represents the next line in
	the paragraph."
	"Set up margins"
	| _gsSqueakTemp_runLength _gsSqueakTemp_stopCondition |
	leftMargin := lineRectangle left.
	leftSide
		ifTrue: [leftMargin := leftMargin
						+ (firstLine
								ifTrue: [textStyle firstIndent]
								ifFalse: [textStyle restIndent])].
	destX := spaceX := leftMargin.
	rightMargin := lineRectangle right.
	rightSide
		ifTrue: [rightMargin := rightMargin - textStyle rightIndent].
	lastIndex := startIndex.
	"scanning sets last index"
	destY := lineRectangle top.
	lineHeight := baseline := 0.
	"Will be increased by setFont"
	line := (TextLine
				start: lastIndex
				stop: 0
				internalSpaces: 0
				paddingWidth: 0)
				rectangle: lineRectangle.
	self setStopConditions.
	"also sets font"
	_gsSqueakTemp_runLength := text runLengthFor: startIndex.
	runStopIndex := (lastIndex := startIndex) + (_gsSqueakTemp_runLength - 1).
	nextIndexAfterLineBreak := spaceCount := 0.
	lastBreakIsNotASpace := false.
	self handleIndentation.
	leftMargin := destX.
	line leftMargin: leftMargin.
	[_gsSqueakTemp_stopCondition := self
				scanCharactersFrom: lastIndex
				to: runStopIndex
				in: text string
				rightX: rightMargin.
	"See setStopConditions for stopping conditions for composing."
	self perform: _gsSqueakTemp_stopCondition] whileFalse.
	^ line lineHeight: lineHeight + textStyle leading baseline: baseline + textStyle leading