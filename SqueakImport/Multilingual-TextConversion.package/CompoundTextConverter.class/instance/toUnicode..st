private
toUnicode: aChar

	| charset v |
	aChar leadingChar = 0 ifTrue: [^ aChar].
	charset := (EncodedCharSet charsetAt: aChar leadingChar) charsetClass.
	v := charset convertToUnicode: aChar charCode.
	^ Character leadingChar: charset unicodeLeadingChar code: v