conversion
nextFromStream: aStream

	| char1 value1 char2 value2 unicode char3 value3 char4 value4 |
	aStream isBinary ifTrue: [^ aStream basicNext].
	char1 := aStream basicNext.
	char1 ifNil:[^ nil].
	value1 := char1 asInteger.
	value1 <= 127 ifTrue: [
		"1-byte char"
		^ char1 asCharacter
	].

	"at least 2-byte char"
	char2 := aStream basicNext.
	char2 ifNil:[^self errorMalformedInput: (String with: char1 asCharacter)].
	value2 := char2 asInteger.

	(value1 bitAnd: 16rE0) = 192 ifTrue: [
		^ Unicode value: ((value1 bitAnd: 31) bitShift: 6) + (value2 bitAnd: 63).
	].

	"at least 3-byte char"
	char3 := aStream basicNext.
	char3 ifNil:[^self errorMalformedInput: (String with: char1 asCharacter with: char2 asCharacter)].
	value3 := char3 asInteger.
	(value1 bitAnd: 16rF0) = 224 ifTrue: [
		unicode := ((value1 bitAnd: 15) bitShift: 12) + ((value2 bitAnd: 63) bitShift: 6)
				+ (value3 bitAnd: 63).
	].

	(value1 bitAnd: 16rF8) = 240 ifTrue: [
		"4-byte char"
		char4 := aStream basicNext.
		char4 ifNil:[^self errorMalformedInput: (String with: char1 asCharacter with: char2 asCharacter with: char3 asCharacter)].
		value4 := char4 asInteger.
		unicode := ((value1 bitAnd: 16r7) bitShift: 18) +
					((value2 bitAnd: 63) bitShift: 12) + 
					((value3 bitAnd: 63) bitShift: 6) +
					(value4 bitAnd: 63).
	].

	unicode ifNil:[^self errorMalformedInput: (String with: char1 asCharacter with: char2 asCharacter with: char3 asCharacter)].
	unicode > 16r10FFFD ifTrue: [
		^self errorMalformedInput: (String with: char1 asCharacter with: char2 asCharacter with: char3 asCharacter).
	].
	
	unicode = 16rFEFF ifTrue: [^ self nextFromStream: aStream].
	^ Unicode value: unicode.
