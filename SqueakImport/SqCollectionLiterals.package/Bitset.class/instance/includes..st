*SqCollectionLiterals-*SqCollectionLiterals-testing
includes: anInteger

	anInteger isInteger ifFalse: [ ^false ].
	-1 < anInteger ifFalse: [ ^false ].
	anInteger < self capacity ifFalse: [ ^false ].
	^(self bitAt: anInteger) = 1
