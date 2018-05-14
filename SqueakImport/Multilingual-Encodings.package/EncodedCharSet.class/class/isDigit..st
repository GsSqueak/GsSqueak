character classification
isDigit: char
	"Answer whether char has the code of a digit in this encoding."
	^self isDigitCode: char charCode
