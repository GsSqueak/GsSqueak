testing
testTextSqkProjectLink
	| att |
	att := TextSqkProjectLink new url: 'a URL string'.
	self testScanAttribute: att encodedWithCharacter: $p decodedWithBlock: [:strm | TextSqkProjectLink scanFrom: strm]