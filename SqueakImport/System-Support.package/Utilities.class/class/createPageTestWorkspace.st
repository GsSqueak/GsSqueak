miscellaneous
createPageTestWorkspace
	"Used to generate a workspace window for testing page up and page down stuff."
	"Utilities createPageTestWorkspace"

	| numberOfLines maxStringLength minLineCounterSize lineCounterSize offsetSize stream headerConstant prevStart prevStrLen prevLineNumber |
	numberOfLines := 400.
	maxStringLength := 22.
	minLineCounterSize := 3.
	lineCounterSize := (numberOfLines log asInteger + 1) max: minLineCounterSize.
	offsetSize := 5.
	stream := String new writeStream.
	headerConstant := lineCounterSize + 1 + offsetSize + 1.
	prevStart := headerConstant negated.
	prevStrLen := 0.
	prevLineNumber := 0.
	numberOfLines timesRepeat: [ | log stringLen pad lineNumber charIndex start |
		stringLen := maxStringLength atRandom max: 1.
		lineNumber := prevLineNumber + 1.
		start := prevStart + prevStrLen + headerConstant + 1.
		prevStart := start.
		prevStrLen := stringLen.
		prevLineNumber := lineNumber.
		log := lineNumber log asInteger.
		pad := lineCounterSize - log - 1.
		pad timesRepeat: [stream nextPutAll: '0'].
		stream nextPutAll: lineNumber printString.
		stream space.
		log := start log asInteger.
		pad := offsetSize - log - 1.
		pad timesRepeat: [stream nextPutAll: '0'].
		stream nextPutAll: start printString.
		stream space.
		charIndex := 'a' first asInteger.
		stringLen timesRepeat: [ | char |
			char := Character value: charIndex.
			charIndex := charIndex + 1.
			stream nextPut: char].
		lineNumber = numberOfLines ifFalse: [stream cr]
		].
	UIManager default edit: stream contents label: 'Test Data'.
