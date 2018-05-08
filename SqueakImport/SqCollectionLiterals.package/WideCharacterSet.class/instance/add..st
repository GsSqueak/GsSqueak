adding
add: aCharacter

	| value highBits lowBits |
	(value := aCharacter asInteger) < 256 ifTrue: [
		byteArrayMap at: value + 1 put: 1 ].
	highBits := value bitShift: highBitsShift.
	lowBits := value bitAnd: lowBitsMask.
	(map at: highBits ifAbsentPut: [ Bitset new: bitsetCapacity ])
		setBitAt: lowBits.
	^aCharacter
