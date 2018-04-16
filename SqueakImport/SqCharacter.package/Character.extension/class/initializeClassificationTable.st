*SqCharacter-class initialization
initializeClassificationTable
	"Initialize the classification table.
	The classification table is a compact encoding of upper and lower cases and digits of characters with
		- bits 0-7: The lower case value of this character or 0, if its greater than 255.
		- bits 8-15: The upper case value of this character or 0, if its greater than 255.
		- bit 16: lowercase bit (isLowercase == true)
		- bit 17: uppercase bit (isUppercase == true)
		- bit 18: digit bit (isDigit == true)"
	" self initializeClassificationTable "

	| encodedCharSet newClassificationTable |
	"Base the table on the EncodedCharset of these characters' leadingChar - 0."
	encodedCharSet := EncodedCharSet charsetAt: 0.

	LowercaseBit := 1 bitShift: 16.
	UppercaseBit := 1 bitShift: 17.
	DigitBit := 1 bitShift: 18.

	"Initialize the letter mask (e.g., isLetter == true)"
	LetterMask := LowercaseBit bitOr: UppercaseBit.

	"Initialize the alphanumeric mask (e.g. isAlphaNumeric == true)"
	AlphaNumericMask := LetterMask bitOr: DigitBit.

	"Initialize the table based on encodedCharSet."
	newClassificationTable := Array new: 256.
	0 to: 255 do: [ :code |
		| isLowercase isUppercase isDigit lowercaseCode uppercaseCode value |
		isLowercase := encodedCharSet isLowercaseCode: code.
		isUppercase := encodedCharSet isUppercaseCode: code.
		isDigit := encodedCharSet isDigitCode: code.
		lowercaseCode := encodedCharSet toLowercaseCode: code.
		lowercaseCode > 255 ifTrue: [ lowercaseCode := 0 ].
		uppercaseCode := encodedCharSet toUppercaseCode: code.
		uppercaseCode > 255 ifTrue: [ uppercaseCode := 0 ].
		value := (uppercaseCode bitShift: 8) + lowercaseCode.
		isLowercase ifTrue: [ value := value bitOr: LowercaseBit ].
		isUppercase ifTrue: [ value := value bitOr: UppercaseBit ].
		isDigit ifTrue: [ value := value bitOr: DigitBit ].
		newClassificationTable at: code + 1 put: value ].
	ClassificationTable := newClassificationTable
