testing
testScanAttribute: att fromStream: strm encodedWithCharacter: aCharacter decodedWithBlock: aBlock
	"This is intended to test internal encoding of a TextAttribute.
	The first char is decoded by this method, the optional parameters by aBlock"
	| identifierCharacter att2 |
	identifierCharacter := strm next.
	self assert: aCharacter equals: identifierCharacter.
	self assert: att class equals: (TextAttribute classFor: aCharacter).
	att2 := aBlock value: strm.
	self assert: strm atEnd.
	^att2
