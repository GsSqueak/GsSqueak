testing
doTestTextFontReferenceSerializationFor: font

	| att att3 fontReferenceString stream |
	att := TextFontReference toFont: font.
	stream := self streamWithAttribute: att.
	fontReferenceString := self testScanAttribute: att fromStream: stream encodedWithCharacter: $F decodedWithBlock: [:strm | strm upToEnd].
	self assert: font familyName, '#', font height equals: fontReferenceString.
	stream reset.
	att3 := TextAttribute newFrom: stream.
	self assert: att equals: att3.