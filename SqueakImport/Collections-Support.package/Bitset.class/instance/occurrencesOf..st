enumerating
occurrencesOf: anObject
	"Answer how many of the receiver's elements are equal to anObject. Optimized version."

	(self includes: anObject) ifTrue: [ ^1 ].
	^0