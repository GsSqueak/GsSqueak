*SqCharacter-converting
asUnicode
	"Answer the unicode encoding of the receiver"
	
	| integerValue |
	(integerValue := self asInteger) <= 16r3FFFFF ifTrue: [ ^integerValue ].
	^self encodedCharSet charsetClass convertToUnicode: (integerValue bitAnd: 16r3FFFFF)
