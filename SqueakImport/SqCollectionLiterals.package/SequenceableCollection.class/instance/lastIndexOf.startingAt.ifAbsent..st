*SqCollectionLiterals-*SqCollectionLiterals-accessing
lastIndexOf: anElement startingAt: lastIndex ifAbsent: exceptionBlock
	"Answer the index of the last occurence of anElement within the  
	receiver. If the receiver does not contain anElement, answer the
	result of evaluating the argument, exceptionBlock."

	| index |
	(index := self lastIndexOf: anElement startingAt: lastIndex) = 0 ifFalse: [ ^index ].
	^exceptionBlock value
