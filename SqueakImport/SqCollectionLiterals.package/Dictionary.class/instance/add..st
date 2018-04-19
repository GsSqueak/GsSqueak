*SqCollectionLiterals-*SqCollectionLiterals-adding
add: anAssociation

	| index |
	index := self scanFor: anAssociation key.
	(array at: index)
		ifNil: [ self atNewIndex: index put: anAssociation ]
		ifNotNil: [ :element |	element value: anAssociation value ].
	^anAssociation
