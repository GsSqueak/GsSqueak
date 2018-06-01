printing
printOn: aStream

	aStream
		print: socketAddress;
		nextPut: $-; nextPutAll: self addressFamilyName;
		nextPut: $-; nextPutAll: self socketTypeName;
		nextPut: $-; nextPutAll: self protocolName