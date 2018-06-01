miscellaneous
createPageTestWorkspace
	"Used to generate a workspace window for testing page up and page
	down stuff."
	"Utilities createPageTestWorkspace"
	| _gsSqueakTemp_numberOfLines _gsSqueakTemp_maxStringLength _gsSqueakTemp_minLineCounterSize _gsSqueakTemp_lineCounterSize _gsSqueakTemp_offsetSize _gsSqueakTemp_stream _gsSqueakTemp_headerConstant _gsSqueakTemp_prevStart _gsSqueakTemp_prevStrLen _gsSqueakTemp_prevLineNumber |
	_gsSqueakTemp_numberOfLines := 400.
	_gsSqueakTemp_maxStringLength := 22.
	_gsSqueakTemp_minLineCounterSize := 3.
	_gsSqueakTemp_lineCounterSize := _gsSqueakTemp_numberOfLines log asInteger + 1 max: _gsSqueakTemp_minLineCounterSize.
	_gsSqueakTemp_offsetSize := 5.
	_gsSqueakTemp_stream := String new writeStream.
	_gsSqueakTemp_headerConstant := _gsSqueakTemp_lineCounterSize + 1 + _gsSqueakTemp_offsetSize + 1.
	_gsSqueakTemp_prevStart := _gsSqueakTemp_headerConstant negated.
	_gsSqueakTemp_prevStrLen := 0.
	_gsSqueakTemp_prevLineNumber := 0.
	_gsSqueakTemp_numberOfLines
		timesRepeat: [| log stringLen pad lineNumber charIndex start |
			stringLen := _gsSqueakTemp_maxStringLength atRandom max: 1.
			lineNumber := _gsSqueakTemp_prevLineNumber + 1.
			start := _gsSqueakTemp_prevStart + _gsSqueakTemp_prevStrLen + _gsSqueakTemp_headerConstant + 1.
			_gsSqueakTemp_prevStart := start.
			_gsSqueakTemp_prevStrLen := stringLen.
			_gsSqueakTemp_prevLineNumber := lineNumber.
			log := lineNumber log asInteger.
			pad := _gsSqueakTemp_lineCounterSize - log - 1.
			pad
				timesRepeat: [_gsSqueakTemp_stream nextPutAll: '0'].
			_gsSqueakTemp_stream nextPutAll: lineNumber printString.
			_gsSqueakTemp_stream space.
			log := start log asInteger.
			pad := _gsSqueakTemp_offsetSize - log - 1.
			pad
				timesRepeat: [_gsSqueakTemp_stream nextPutAll: '0'].
			_gsSqueakTemp_stream nextPutAll: start printString.
			_gsSqueakTemp_stream space.
			charIndex := 'a' first asInteger.
			stringLen
				timesRepeat: [| char |
					char := Character value: charIndex.
					charIndex := charIndex + 1.
					_gsSqueakTemp_stream nextPut: char].
			lineNumber = _gsSqueakTemp_numberOfLines
				ifFalse: [_gsSqueakTemp_stream cr]].
	UIManager default edit: _gsSqueakTemp_stream contents label: 'Test Data'