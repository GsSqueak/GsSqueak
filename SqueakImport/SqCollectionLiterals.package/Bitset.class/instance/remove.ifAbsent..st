*SqCollectionLiterals-*SqCollectionLiterals-removing
remove: anInteger ifAbsent: absentBlock

	(self clearBitAt: anInteger) ifTrue: [ ^anInteger ].
	^absentBlock value
