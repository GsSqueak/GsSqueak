*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-platform independent access
long64At: index bigEndian: bigEndian
	"Return a 64-bit signed integer quantity starting from the given byte index."

	| value |
	value := self unsignedLong64At: index bigEndian: bigEndian.
	value digitLength < 8 ifTrue: [ ^value ].
	(value digitAt: 8) < 16r80 ifTrue: [ ^value ].
	^value - 16r10000000000000000
