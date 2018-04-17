accessing
indexOf: anElement startingAt: start ifAbsent: exceptionBlock
	"Answer the index of the first occurence of anElement after start
	within the receiver. If the receiver does not contain anElement, 
	answer the 	result of evaluating the argument, exceptionBlock."

	| index |
	(index := self indexOf: anElement startingAt: start) = 0 ifFalse: [ ^index ].
	^exceptionBlock value