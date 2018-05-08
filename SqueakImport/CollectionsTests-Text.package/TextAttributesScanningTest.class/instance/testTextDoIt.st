testing
testTextDoIt
	| att |
	att := TextDoIt evalString: 'foo'.
	self testScanAttribute: att encodedWithCharacter: $d decodedWithBlock: [:strm | TextDoIt scanFrom: strm]