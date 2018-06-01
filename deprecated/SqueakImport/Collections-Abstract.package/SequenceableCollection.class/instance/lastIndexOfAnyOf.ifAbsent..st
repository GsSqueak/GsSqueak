accessing
lastIndexOfAnyOf: aCollection ifAbsent: exceptionBlock
	"Answer the index of the last occurence of any element of aCollection
	within the receiver. If the receiver does not contain any of those
	elements, answer the result of evaluating the argument, exceptionBlock."

	| index |
	(index := self lastIndexOfAnyOf: aCollection startingAt: self size) = 0 ifFalse: [ ^index ].
	^exceptionBlock value