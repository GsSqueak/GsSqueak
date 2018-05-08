testing
testTextLink
	| att |
	att := TextLink new classAndMethod: 'class and method string'.
	self testScanAttribute: att encodedWithCharacter: $L decodedWithBlock: [:strm | TextLink scanFrom: strm].