*SqCollectionLiterals-*SqCollectionLiterals-enumerating
union: aCollection
	aCollection class = self class ifTrue: [^(self complement intersection: aCollection complement) complement].
	(self isCharacters: aCollection) ifFalse: [^super union: aCollection].
	^(absent reject: [:e | aCollection includes: e]) complement
