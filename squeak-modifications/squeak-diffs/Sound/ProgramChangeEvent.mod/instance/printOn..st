printing
printOn: aStream

	aStream nextPut: $(.
	time printOn: aStream.
	aStream nextPutAll: ': prog '.
	program printOn: aStream.
	aStream nextPut: $).
