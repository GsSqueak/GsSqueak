instance creation
stringStream: aStream dataStream: anotherStream

	^ self new
		stringStream: aStream;
		dataStream: anotherStream;
		yourself