*SqCollectionLiterals-*SqCollectionLiterals-enumerating
groupBy: keyBlock
	"Like in SQL operation - Split the recievers contents into collections of elements for which keyBlock returns the same results, and return them."

	| result |
	result := Dictionary new.
	self do: [ :each | 
		| key |
		key := keyBlock value: each.
		(result at: key ifAbsentPut: [ OrderedCollection new ]) 
			add: each ].
	^result
