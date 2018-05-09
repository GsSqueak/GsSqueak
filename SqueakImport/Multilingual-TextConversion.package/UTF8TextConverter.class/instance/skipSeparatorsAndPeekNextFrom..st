fileIn/Out
skipSeparatorsAndPeekNextFrom: aStream
	"Same as #skipSeparators, but returns the next character after the separators if such exists."

	| character |
	[ 
		((character := aStream basicNext) 
			ifNil: [ ^aStream "backwards compatibility, should be nil" ])
				isSeparator ] whileTrue.
	aStream skip: -1.
	^character
	