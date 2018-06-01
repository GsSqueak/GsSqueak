printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self inClass name;
		nextPutAll: ' >> ';
		nextPutAll: self selector