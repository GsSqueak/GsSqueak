printing
printOn: aStream
	aStream
		print: self class;
		nextPut: $<;
		nextPutAll: self name;
		nextPut: $>