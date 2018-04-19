*SqCollectionLiterals-*SqCollectionLiterals-enumerating
do: aBlock
 
	map keysAndValuesDo: [ :index :bitset |
		| highBits |
		highBits := index * bitsetCapacity.
		bitset do: [ :lowBits |
			aBlock value: (Character value: highBits + lowBits) ] ]
