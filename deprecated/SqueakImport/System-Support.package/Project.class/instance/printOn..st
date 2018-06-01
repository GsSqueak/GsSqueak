printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' (', self name, ') in '.
	world printOn: aStream
