*SqCollectionLiterals-*SqCollectionLiterals-enumerating
findNearbyBinaryIndex: aBlock
	"Search for an element in the receiver using binary search.
	The argument aBlock is a one-element block returning
		0 	- if the element is the one searched for
		<0	- if the search should continue in the first half
		>0	- if the search should continue in the second half
	If no matching element is found, answer the closest index we could find,
	answering 0 if the element should preceed all items in the collection,
	and size + 1 if the element should follow all items in the collection."
	
	^self
		findBinaryIndex: aBlock
		ifNone: [ :lower :upper |
			lower = self size
				ifTrue: [ upper ]
				ifFalse: [ lower ] ]
