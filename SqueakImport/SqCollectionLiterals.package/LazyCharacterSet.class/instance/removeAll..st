*SqCollectionLiterals-*SqCollectionLiterals-removing
removeAll: aCollection
	self block: [:c | (aCollection include: c) not and: [block value: c]].
	^aCollection
