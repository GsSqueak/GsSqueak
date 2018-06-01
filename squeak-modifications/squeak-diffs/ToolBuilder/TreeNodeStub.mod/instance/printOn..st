printing
printOn: aStream
	aStream
		print: self class;
		nextPut: $<;
		print: item;
		nextPut: $>