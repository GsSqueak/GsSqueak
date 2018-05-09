conversion
nextPut: aCharacter toStream: aStream

	| charCode leadingChar aChar |
	aStream isBinary ifTrue: [^aCharacter storeBinaryOn: aStream].
	aChar := aCharacter.
	charCode := aCharacter charCode.
	aChar isTraditionalDomestic ifFalse: [	
		(16rFF61 <= charCode and: [charCode <= 16rFF9F]) ifTrue: [
			^aStream basicNextPut: (self sjisKatakanaFor: charCode) ].
		aChar := (JISX0208 charFromUnicode: charCode) ifNil: [ 
			^aCharacter "an error or nil may be better" ].
		charCode := aChar charCode ].
	(leadingChar := aChar leadingChar) = 0 ifTrue: [
		charCode < 256 ifTrue: [
			(latin1Encodings at: charCode + 1)
				ifNil: [ aStream basicNextPut: aChar ]
				ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ].
			^aChar ].
		^aStream basicNextPut: aChar ].
	leadingChar = self leadingChar ifTrue: [
		| upper lower | 
		upper := charCode // 94 + 33.
		lower := charCode \\ 94 + 33.
		upper \\ 2 = 1 ifTrue: [
			upper := upper + 1 / 2 + 112.
			lower := lower + 31
		] ifFalse: [
			upper := upper / 2 + 112.
			lower := lower + 125
		].
		upper >= 160 ifTrue: [upper := upper + 64].
		lower >= 127 ifTrue: [lower := lower + 1].
		aStream 
			basicNextPut: (Character value: upper);
			basicNextPut: (Character value: lower) ].
	^aChar
