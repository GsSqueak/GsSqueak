*SqCharacter-accessing
digitValue
	"Answer 0-9 if the receiver is $0-$9, 10-35 if it is $A-$Z, and < 0 
	otherwise. This is used to parse literal numbers of radix 2-36."

	| integerValue |
	(integerValue := self asInteger) > 16rFF ifTrue: [^self encodedCharSet digitValueOf: self].
	^DigitValues at: integerValue + 1
