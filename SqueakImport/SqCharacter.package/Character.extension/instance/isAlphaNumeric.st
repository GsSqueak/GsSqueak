*SqCharacter-testing
isAlphaNumeric
	"Answer whether the receiver is a letter or a digit."

	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [ 
		^((ClassificationTable at: integerValue + 1) bitAnd: AlphaNumericMask) > 0 ].
	^self encodedCharSet isAlphaNumeric: self
