character classification
isAlphaNumericCode: anInteger
	"Answer whether anInteger is the code of a letter or a digit."

	^(self isLetterCode: anInteger) or: [ self isDigitCode: anInteger ]
