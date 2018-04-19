*SqCollectionLiterals-*SqCollectionLiterals-converting
complement
	^self class including: [:char | (block value: char) not]
