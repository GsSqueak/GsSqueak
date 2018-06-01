conversion
nextPut: aCharacter toStream: aStream

	| charCode leadingChar class |
	aStream isBinary ifTrue: [^aCharacter storeBinaryOn: aStream].
	aCharacter isTraditionalDomestic ifFalse: [
		class := (EncodedCharSet charsetAt: aCharacter leadingChar) traditionalCharsetClass.
		charCode := (class charFromUnicode: aCharacter asUnicode) charCode.
		leadingChar := class leadingChar.
	] ifTrue: [
		charCode := aCharacter charCode.
		leadingChar := aCharacter leadingChar.
	].
	charCode < 256 ifTrue: [
		(latin1Encodings at: charCode + 1)
			ifNil: [ aStream basicNextPut: aCharacter ]
			ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ].
		^aCharacter ].
	self 
		nextPutValue: charCode
		toStream: aStream
		withShiftSequenceIfNeededForLeadingChar: leadingChar.
	^aCharacter
