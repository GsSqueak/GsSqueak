printing
printOn: aStream
	aStream nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: self contentType;
		nextPutAll: ', '.
	self content
		ifNotNil: [aStream
			nextPutAll: self content size printString;
			nextPutAll: ' bytes)']
		ifNil: [aStream nextPutAll: 'unknown size)'].