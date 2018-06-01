accessing
add: anAssociation

	| index |
	index := self scanFor: anAssociation key.
	(array at: index)
		ifNil: [ self atNewIndex: index put: anAssociation ]
		ifNotNil: [ :element |
				element == vacuum
					ifTrue: [ self atNewIndex: index put: anAssociation ]
					ifFalse: [ element value: anAssociation value ] ].
	^anAssociation