testing
testScanAttribute: att encodedWithCharacter: aCharacter decodedWithBlock: aBlock
	"Test official encoding API, internal encoding details, and official decoding API for a specific TextAttribute"
	| stream att2 att3 |
	"First encode the TextAttribute on a Stream"
	stream := self streamWithAttribute: att.
	"Then test internal encoding"
	att2 := self testScanAttribute: att fromStream: stream encodedWithCharacter: aCharacter decodedWithBlock: aBlock.
	self assert: att equals: att2.
	"Then test normal decoding API"
	stream reset.
	att3 := TextAttribute newFrom: stream.
	self assert: att equals: att3.
