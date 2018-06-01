printing
printOn: aStream

	aStream nextPut: $(.
	time printOn: aStream.
	aStream nextPutAll: ': bend '.
	bend printOn: aStream.
	aStream nextPut: $).
