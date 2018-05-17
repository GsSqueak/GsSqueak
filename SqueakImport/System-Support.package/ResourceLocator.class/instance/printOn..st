printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(;
		print: urlString;
		nextPut: $)