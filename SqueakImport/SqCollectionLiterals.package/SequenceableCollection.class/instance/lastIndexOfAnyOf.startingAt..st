*SqCollectionLiterals-*SqCollectionLiterals-accessing
lastIndexOfAnyOf: aCollection startingAt: lastIndex
	"Answer the index of the last occurence of any element of aCollection
	within the receiver. If the receiver does not contain any of those
	elements, answer 0"

	lastIndex to: 1 by: -1 do: [ :index |
		(aCollection includes: (self at: index)) ifTrue: [ ^index ] ].
	^0
