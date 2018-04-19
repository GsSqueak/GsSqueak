*SqCollectionLiterals-*SqCollectionLiterals-removing
remove: aCharacter
	self block: [:c | (c = aCharacter) not and: [block value: c]].
	^aCharacter
