printing
printOn: aStream

	aStream nextPut: $(.
	time printOn: aStream.
	aStream nextPutAll: ': '.
	aStream nextPutAll: self keyName.
	aStream space.
	duration printOn: aStream.
	aStream nextPut: $).
