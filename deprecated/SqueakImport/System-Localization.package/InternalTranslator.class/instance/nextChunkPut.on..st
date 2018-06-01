fileIn/fileOut
nextChunkPut: anObject on: aStream 
	| i remainder terminator |
	terminator := $!.
	remainder := anObject storeString.
	[(i := remainder indexOf: terminator) = 0]
		whileFalse: [aStream
				nextPutAll: (remainder copyFrom: 1 to: i).
			aStream nextPut: terminator.
			"double imbedded terminators"
			remainder := remainder copyFrom: i + 1 to: remainder size].
	aStream nextPutAll: remainder.
	aStream nextPut: terminator; cr.