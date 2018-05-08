accessing
lastIndexOfAnyOf: aCollection
	"Answer the index of the last occurence of any element of aCollection
	within the receiver. If the receiver does not contain any of those
	elements, answer 0"

	^self lastIndexOfAnyOf: aCollection startingAt: self size
