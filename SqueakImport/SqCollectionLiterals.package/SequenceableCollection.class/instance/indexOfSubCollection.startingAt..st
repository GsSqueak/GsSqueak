*SqCollectionLiterals-*SqCollectionLiterals-accessing
indexOfSubCollection: subCollection startingAt: start
	"Answer the index of the receiver's first element, such that that element 
	equals the first element of sub, and the next elements equal 
	the rest of the elements of sub. Begin the search at element 
	start of the receiver. If no such match is found, answer 0."

	| first index subCollectionSize |
	(subCollectionSize := subCollection size) = 0 ifTrue: [ ^0 ].
	first := subCollection at: 1.
	(start max: 1) to: self size - subCollectionSize + 1 do: [ :startIndex |
		(self at: startIndex) = first ifTrue: [
			index := 2.
			[ index <= subCollectionSize 
				and: [ (self at: startIndex + index - 1) = (subCollection at: index) ] ]
				whileTrue: [ index := index + 1 ].
			index <= subCollectionSize ifFalse: [ ^startIndex ] ] ].
	^0
