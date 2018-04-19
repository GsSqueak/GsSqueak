*SqCollectionLiterals-*SqCollectionLiterals-removing
remove: aCharacter ifAbsent: aBlock

	| value highBits lowBits bitset |
	(value := aCharacter asInteger) < 256 ifTrue: [
		(byteArrayMap at: value + 1) = 0 ifTrue: [ ^aBlock value ].
		byteArrayMap at: value + 1 put: 0 ].
	highBits := value bitShift: highBitsShift.
	lowBits := value bitAnd: lowBitsMask.
	bitset := (map at: highBits ifAbsent: nil) ifNil: [ ^aBlock value ].
	((bitset clearBitAt: lowBits) and: [ bitset size = 0 ]) ifTrue: [
		map removeKey: highBits ].
	^aCharacter
