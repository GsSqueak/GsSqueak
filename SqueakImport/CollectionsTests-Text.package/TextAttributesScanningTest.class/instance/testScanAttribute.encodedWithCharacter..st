testing
testScanAttribute: att encodedWithCharacter: aCharacter
	^self testScanAttribute: att encodedWithCharacter: aCharacter decodedWithBlock: [:strm | att]
