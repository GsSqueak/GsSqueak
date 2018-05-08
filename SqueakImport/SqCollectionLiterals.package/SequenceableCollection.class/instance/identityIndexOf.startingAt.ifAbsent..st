accessing
identityIndexOf: anElement startingAt: startIndex ifAbsent: exceptionBlock
	"Answer the index of anElement within the receiver starting at startIndex.
	If the receiver does not contain anElement, answer the result of evaluating
	the argument, exceptionBlock."
	
	| index |
	(index := self identityIndexOf: anElement startingAt: startIndex) = 0 ifFalse: [ ^index ].
	^exceptionBlock value
