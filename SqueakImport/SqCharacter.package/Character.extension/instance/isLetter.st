*SqCharacter-testing
isLetter

	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [
		^((ClassificationTable at: integerValue + 1) bitAnd: LetterMask) > 0 ].
	^self encodedCharSet isLetter: self
