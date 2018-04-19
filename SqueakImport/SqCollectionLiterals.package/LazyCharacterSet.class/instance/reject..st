*SqCollectionLiterals-*SqCollectionLiterals-enumerating
reject: aBlock
	^self class including: [:char | (aBlock value: char) not and: [block value: char]]
