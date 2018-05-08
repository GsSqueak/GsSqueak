testing
testTextURL
	| att |
	att := TextURL new url: 'a URL string'.
	self testScanAttribute: att encodedWithCharacter: $R decodedWithBlock: [:strm | TextURL scanFrom: strm]