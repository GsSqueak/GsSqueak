printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' >> ';
		nextPutAll: self selector