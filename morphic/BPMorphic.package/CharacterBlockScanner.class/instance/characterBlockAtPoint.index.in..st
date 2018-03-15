scanning
characterBlockAtPoint: aPoint index: index in: textLine 
	"This method is the Morphic characterBlock finder. It combines
	MVC's characterBlockAtPoint:, -ForIndex:, and buildCharacterBlockIn:"
	| _gsSqueakTemp_runLength _gsSqueakTemp_lineStop _gsSqueakTemp_stopCondition |
	line := textLine.
	rightMargin := line rightMargin.
	lastIndex := line first.
	self setStopConditions.
	"also sets font"
	characterIndex := index.
	"== nil means scanning for point"
	characterPoint := aPoint.
	(characterPoint isNil
			or: [characterPoint y > line bottom])
		ifTrue: [characterPoint := line bottomRight].
	destX := leftMargin := line leftMarginForAlignment: alignment.
	destY := line top.
	(text isEmpty
			or: [(characterPoint y < destY
						or: [characterPoint x < destX])
					or: [characterIndex notNil
							and: [characterIndex < line first]]])
		ifTrue: [^ (CharacterBlock new
				stringIndex: line first
				text: text
				topLeft: destX @ destY
				extent: 0 @ textStyle lineGrid)
				textLine: line].
	_gsSqueakTemp_runLength := text runLengthFor: line first.
	_gsSqueakTemp_lineStop := characterIndex
				ifNil: ["scanning for index"
					line last].
	"scanning for point"
	runStopIndex := lastIndex + (_gsSqueakTemp_runLength - 1) min: _gsSqueakTemp_lineStop.
	lastCharacterWidth := 0.
	spaceCount := 0.
	[_gsSqueakTemp_stopCondition := self
				scanCharactersFrom: lastIndex
				to: runStopIndex
				in: text string
				rightX: characterPoint x.
	"see setStopConditions for stopping conditions for character block
	operations. "
	self perform: _gsSqueakTemp_stopCondition] whileFalse.
	characterIndex
		ifNil: ["Result for characterBlockAtPoint:"
			^ (CharacterBlock new
				stringIndex: lastIndex
				text: text
				topLeft: characterPoint + (font descentKern @ 0)
				extent: lastCharacterWidth @ line lineHeight - (font baseKern @ 0))
				textLine: line]
		ifNotNil: ["Result for characterBlockForIndex:"
			^ (CharacterBlock new
				stringIndex: characterIndex
				text: text
				topLeft: characterPoint + (font descentKern - kern @ 0)
				extent: lastCharacterWidth @ line lineHeight)
				textLine: line]