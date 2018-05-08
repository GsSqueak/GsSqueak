testing
doTestTextFontReferenceTTCFor: font

	| att att3 fontReferenceString stream |
	att := TextFontReference toFont: font.
	stream := self streamWithAttribute: att.
	fontReferenceString := self testScanAttribute: att fromStream: stream encodedWithCharacter: $F decodedWithBlock: [:strm | strm upToEnd].
	self assert: font familyName, '#', font height equals: fontReferenceString.
	stream reset.
	att3 := TextAttribute newFrom: stream.
	"test font height only, see comment above"
	self assert: att font height equals: att3 font height.
	"we really want an exact match, which probably requires different implentation of TextFontReference"
	self assert: att equals: att3.
