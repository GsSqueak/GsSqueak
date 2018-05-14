conversion
nextPut: aCharacter toStream: aStream 
	| charCode leadingChar nonUnicodeChar |
	aStream isBinary ifTrue: [^aCharacter storeBinaryOn: aStream].
	charCode := aCharacter charCode.
	leadingChar := aCharacter leadingChar.
	(leadingChar = 0 and: [ charCode < 256 ]) ifTrue: [
		(latin1Encodings at: charCode + 1)
			ifNil: [ aStream basicNextPut: aCharacter ]
			ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ].
		^aCharacter ].
	aCharacter isTraditionalDomestic
		ifFalse: [ nonUnicodeChar := self nonUnicodeClass charFromUnicode: charCode ]
		ifTrue: [ nonUnicodeChar := Character value: charCode ].
	nonUnicodeChar ifNotNil: [
		charCode := nonUnicodeChar charCode.
		aStream
			basicNextPut: (Character value: charCode // 94 + 161);
			basicNextPut: (Character value: charCode \\ 94 + 161) ].
	^aCharacter
