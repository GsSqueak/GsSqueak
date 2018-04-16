*SqCharacter-converting
asLowercase
	"Answer the receiver's matching lowercase Character."
	
	| integerValue |
	(integerValue := self asInteger) > 255 ifFalse: [ 
		| result |
		(result := (ClassificationTable at: integerValue + 1) bitAnd: 16rFF) > 0
			ifTrue: [ ^self class value: result ] ].
	^self class value: (self encodedCharSet toLowercaseCode: integerValue)
