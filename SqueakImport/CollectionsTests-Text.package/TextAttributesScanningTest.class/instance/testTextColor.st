testing
testTextColor
	| att |
	att := TextColor color: Color red.
	self testScanAttribute: att encodedWithCharacter: $c decodedWithBlock: [:strm | TextColor scanFrom: strm]