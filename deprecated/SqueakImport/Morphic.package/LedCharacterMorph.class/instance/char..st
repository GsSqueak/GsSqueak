accessing
char: aCharacter 
	char := aCharacter digitValue.
	char >= 0 & (char <= 35) ifFalse: [char := 36]