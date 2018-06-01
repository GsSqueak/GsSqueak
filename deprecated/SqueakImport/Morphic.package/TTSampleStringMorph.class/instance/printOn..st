printing
printOn: aStream
	aStream nextPutAll: 'TTSampleString(';
		nextPutAll: font familyName;
		nextPut: $)