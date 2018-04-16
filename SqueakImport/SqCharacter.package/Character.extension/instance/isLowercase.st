*SqCharacter-testing
isLowercase

	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [
		^((ClassificationTable at: integerValue + 1) bitAnd: LowercaseBit) > 0 ].
	^self encodedCharSet isLowercase: self.
