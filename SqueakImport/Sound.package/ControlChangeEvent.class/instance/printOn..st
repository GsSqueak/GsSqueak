printing
printOn: aStream
	aStream
		nextPut: $(;
		print: time;
		nextPutAll: ': ctrl[';
		print: control;
		nextPutAll: ']=';
		print: value;
		nextPut: $)