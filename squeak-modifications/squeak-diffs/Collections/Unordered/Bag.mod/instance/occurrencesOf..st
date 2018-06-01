enumerating
occurrencesOf: anObject
	"Answer how many of the receiver's elements are equal to anObject. Optimized version."

	^contents at: anObject ifAbsent: 0