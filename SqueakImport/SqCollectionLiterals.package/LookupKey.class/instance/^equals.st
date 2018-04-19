*SqCollectionLiterals-*SqCollectionLiterals-comparing
= aLookupKey

	self species = aLookupKey species
		ifTrue: [^key = aLookupKey key]
		ifFalse: [^false]
