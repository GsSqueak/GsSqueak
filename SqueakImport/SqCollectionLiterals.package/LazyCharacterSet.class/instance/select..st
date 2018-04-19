*SqCollectionLiterals-*SqCollectionLiterals-enumerating
select: aBlock
	^self class including: [:char | (block value: char) and: [aBlock value: char]]
