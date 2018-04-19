*SqCollectionLiterals-*SqCollectionLiterals-enumerating
union: aCollection
	(self isCharacters: aCollection) ifFalse: [^super union: aCollection].
	^self class including: [:c | (aCollection includes: c) or: [block value: c]]
