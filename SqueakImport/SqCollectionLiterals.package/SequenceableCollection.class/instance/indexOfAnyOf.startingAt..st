*SqCollectionLiterals-*SqCollectionLiterals-accessing
indexOfAnyOf: aCollection startingAt: start
	"Answer the index of the first occurence of any element included in aCollection after start within the receiver.
	If the receiver does not contain anElement, answer zero, which is an invalid index."

	start to: self size do: [ :index |
		(aCollection includes: (self at: index)) ifTrue: [ ^index ] ].
	^0
