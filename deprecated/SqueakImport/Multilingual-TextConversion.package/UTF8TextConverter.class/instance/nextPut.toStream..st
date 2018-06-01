conversion
nextPut: aCharacter toStream: aStream 
	
	| nBytes mask shift ucs2code |
	aStream isBinary ifTrue: [ ^aCharacter storeBinaryOn: aStream ].
	ucs2code := aCharacter asUnicode ifNil: [ ^aCharacter ].
	ucs2code < 256 ifTrue: [
		(latin1Encodings at: ucs2code + 1)
			ifNil: [ aStream basicNextPut: aCharacter ]
			ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ].
		^aCharacter ].
	nBytes := ucs2code highBit + 3 // 5.
	mask := #[128 192 224 240 248 252 254 255] at: nBytes.
	shift := nBytes - 1 * -6.
	aStream basicNextPut: (Character value: (ucs2code bitShift: shift) + mask).
	2 to: nBytes do: [ :i | 
		shift := shift + 6.
		aStream basicNextPut: (
			Character value: ((ucs2code bitShift: shift) bitAnd: 63) + 128) ].
	^aCharacter.
