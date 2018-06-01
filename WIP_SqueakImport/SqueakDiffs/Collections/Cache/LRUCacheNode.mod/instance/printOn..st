accessing
printOn: stream

	super printOn: stream.
	stream
		nextPut: $(;
		print: key;
		nextPutAll: ', ';
		print: value;
		nextPut: $)