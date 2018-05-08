accessing
identityIndexOf: anElement ifAbsent: exceptionBlock
	"Answer the index of anElement within the receiver. If the receiver does 
	not contain anElement, answer the result of evaluating the argument, 
	exceptionBlock."
	
	| index |
	(index := self identityIndexOf: anElement startingAt: 1) = 0 ifFalse: [ ^index ].
	^exceptionBlock value
