*SqCharacter-testing
isUppercase

	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [
		^((ClassificationTable at: integerValue + 1) bitAnd: UppercaseBit) > 0 ].
	^self encodedCharSet isUppercase: self.
