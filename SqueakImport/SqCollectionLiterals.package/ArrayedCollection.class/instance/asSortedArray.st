*SqCollectionLiterals-*SqCollectionLiterals-converting
asSortedArray
	self isSorted ifTrue: [^ self asArray].
	^ super asSortedArray
