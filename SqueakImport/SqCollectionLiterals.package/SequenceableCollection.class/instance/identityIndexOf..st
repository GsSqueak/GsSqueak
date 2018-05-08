accessing
identityIndexOf: anElement 
	"Answer the index of anElement within the receiver. If the receiver does 
	not contain anElement, answer 0."

	^self identityIndexOf: anElement startingAt: 1
