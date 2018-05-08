testing
testTextPrintIt
	| att |
	att := TextPrintIt evalString: 'foo'.
	self testScanAttribute: att encodedWithCharacter: $P decodedWithBlock: [:strm | TextPrintIt scanFrom: strm]