as yet unclassified
printOn: aStream

	aStream nextPut: $(.
	time printOn: aStream.
	aStream nextPutAll: ': tempo '.
	aStream nextPutAll:  (120.0 * (500000.0 / tempo) printShowingMaxDecimalPlaces: 2).
	aStream nextPut: $).
