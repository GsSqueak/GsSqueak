*SqCollectionLiterals-*SqCollectionLiterals-accessing
indexOf: anElement startingAt: start
	"Answer the index of the first occurence of anElement after start
	within the receiver. If the receiver does not contain anElement, 
	answer 0."

	start to: self size do: [ :index |
		(self at: index) = anElement ifTrue: [ ^index ] ].
	^0
