*SqCollectionLiterals-*SqCollectionLiterals-removing
remove: aCharacter ifAbsent: aBlock

	| index |
	(index := aCharacter asciiValue + 1) <= 256 ifFalse: [ ^aBlock value ].
	(byteArrayMap at: index) = 0 ifTrue: [ ^aBlock value ].
	byteArrayMap at: index put: 0.
	tally := tally - 1.
	^aCharacter
