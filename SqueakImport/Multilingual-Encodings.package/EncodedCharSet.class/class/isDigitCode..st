character classification
isDigitCode: anInteger
	"Answer whether anInteger is the code of a digit."

	^ anInteger >= 48 and: [anInteger <= 57].
