testing
testTextFontChange
	| att |
	att := TextFontChange font3.
	self testScanAttribute: att encodedWithCharacter: $f decodedWithBlock: [:strm | TextFontChange new fontNumber: (Integer readFrom: strm ifFail: [0])]