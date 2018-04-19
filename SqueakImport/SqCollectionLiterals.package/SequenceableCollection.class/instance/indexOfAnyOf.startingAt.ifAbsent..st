*SqCollectionLiterals-*SqCollectionLiterals-accessing
indexOfAnyOf: aCollection startingAt: start ifAbsent: exceptionBlock
	"Answer the index of the first occurence of any element included in aCollection after start within the receiver.
	If the receiver does not contain anElement, answer the result of evaluating the argument, exceptionBlock.
	Note: it is user responsibility to provide aCollection that behaves relatevily fast when asked for includes: (like a Set)"

	| index |
	(index := self indexOfAnyOf: aCollection startingAt: start) = 0 ifFalse: [ ^index ].
	^exceptionBlock value
