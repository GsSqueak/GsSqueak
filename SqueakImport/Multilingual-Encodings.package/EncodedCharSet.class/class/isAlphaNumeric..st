character classification
isAlphaNumeric: char
	"Answer whether char has the code of a letter or a digit in this encoding."

	^self isAlphaNumericCode: char charCode
