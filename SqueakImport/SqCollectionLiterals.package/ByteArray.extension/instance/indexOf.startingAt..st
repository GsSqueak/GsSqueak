*SqCollectionLiterals-*SqByteArray-accessing
indexOf: anInteger startingAt: start

	anInteger isInteger ifFalse: [ ^0 ].
	0 <= anInteger ifFalse: [ ^0 ].
	anInteger <= 255 ifFalse: [ ^0 ].
	^ByteString indexOfAscii: anInteger inString: self startingAt: start
