testing
includes: anObject

	anObject isCharacter ifFalse: [ ^false ].
	(absent includes: anObject) ifTrue: [ ^false ].
	^true