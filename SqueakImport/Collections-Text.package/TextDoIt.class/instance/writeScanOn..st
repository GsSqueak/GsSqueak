fileIn/fileOut
writeScanOn: strm

	strm nextPut: self class scanCharacter; nextPutAll: evalString; nextPutAll: ';;'