testing
testTextSqkPageLink
	| att |
	att := TextSqkPageLink new url: 'a URL string'.
	self testScanAttribute: att encodedWithCharacter: $q decodedWithBlock: [:strm | TextSqkPageLink scanFrom: strm]