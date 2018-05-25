*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-platform independent access
long64At: index put: value bigEndian: bigEndian
	"Store a 64-bit signed integer quantity starting from the given byte index."
	
	^self
		unsignedLong64At: index
		put: (value negative
			ifFalse: [ value ]
			ifTrue: [ value + 16r10000000000000000 ])
		bigEndian: bigEndian
