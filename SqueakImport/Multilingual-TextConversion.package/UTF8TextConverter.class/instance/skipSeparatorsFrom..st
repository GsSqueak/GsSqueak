fileIn/Out
skipSeparatorsFrom: aStream

	[ (aStream basicNext ifNil: [ ^self ]) isSeparator ] whileTrue.
	aStream skip: -1