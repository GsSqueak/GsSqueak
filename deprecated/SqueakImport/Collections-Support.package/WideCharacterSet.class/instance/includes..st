testing
includes: anObject 

	| value |
	anObject isCharacter ifFalse: [ ^false ].
	(value := anObject asInteger) < 256 ifTrue: [
		^(byteArrayMap at: value + 1) ~= 0 ].
	^((map at: (value bitShift: highBitsShift) ifAbsent: nil) ifNil: [ ^false ])
		includes: (value bitAnd: lowBitsMask)