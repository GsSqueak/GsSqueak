*SqCollectionLiterals-*SqCollectionLiterals-copying
copyUpThrough: anElement 
	"Answer all elements up to and including anObject. If there
	is no such object, answer a copy of the receiver."

	| index |
	index := self indexOf: anElement.
	index = 0 ifTrue: [ ^self copy ].
	^self first: index
