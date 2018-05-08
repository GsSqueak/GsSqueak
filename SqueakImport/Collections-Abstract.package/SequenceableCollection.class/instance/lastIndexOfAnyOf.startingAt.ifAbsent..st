accessing
lastIndexOfAnyOf: aCollection startingAt: lastIndex ifAbsent: exceptionBlock
	"Answer the index of the last occurence of any element of aCollection
	within the receiver. If the receiver does not contain any of those
	elements, answer the result of evaluating the argument, exceptionBlock."

	| index |
	(index := self lastIndexOfAnyOf: aCollection startingAt: lastIndex) = 0 ifFalse: [ ^index ].
	^exceptionBlock value