*SqCollectionLiterals-*SqByteArray-enumerating
occurrencesOf: anObject 
	"Answer how many of the receiver's elements are equal to anObject. Optimized version."

	| tally |
	anObject isInteger ifFalse: [ ^0 ].
	anObject negative ifTrue: [ ^0 ].
	anObject > 255 ifTrue: [ ^0 ].
	tally := 0.
	1 to: self size do: [ :index |
		(self at: index) = anObject ifTrue: [ tally := tally + 1 ] ].
	^tally
