testing
includes: anObject

	| index |
	anObject isCharacter ifFalse: [ ^false ].
	(index := anObject asInteger + 1) > 256 ifTrue: [ ^false ].
	^(byteArrayMap at: index) > 0
