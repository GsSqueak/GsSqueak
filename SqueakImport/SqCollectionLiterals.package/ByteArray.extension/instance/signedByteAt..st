*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-platform independent access
signedByteAt: index
	"Return an 8-bit signed integer quantity from the given byte index."
	
	| byte |
	(byte := self at: index) <= 16r7F ifTrue: [ ^byte ].
	^byte - 16r100
