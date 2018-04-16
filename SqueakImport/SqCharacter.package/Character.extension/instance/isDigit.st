*SqCharacter-testing
isDigit

	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [
		^((ClassificationTable at: integerValue + 1) bitAnd: DigitBit) > 0 ].
	^self encodedCharSet isDigit: self.
