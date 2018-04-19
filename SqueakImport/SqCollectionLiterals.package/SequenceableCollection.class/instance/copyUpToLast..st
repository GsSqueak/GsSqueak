*SqCollectionLiterals-*SqCollectionLiterals-copying
copyUpToLast: anElement
	"Answer a copy of the receiver from index 1 to the last occurrence of 
	anElement, not including anElement."

	| index |
	index := self lastIndexOf: anElement.
	index = 0 ifTrue: [ ^self copy ].
	^self first: index - 1
