*SqCollectionLiterals-*SqCollectionLiterals-enumerating
intersection: aCollection
	aCollection class = self class ifTrue: [^(self complement union: aCollection complement) complement].
	^(aCollection intersection: self) as: CharacterSet
