connectors
printOn: aStream
	aStream nextPutAll: 'TTSampleFont(';
		nextPutAll: font familyName;
		nextPut: $)