printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ('({1})' format: {self name})