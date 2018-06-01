fileIn/fileOut
writeScanOn: strm

	strm nextPut: self class scanCharacter; nextPutAll: classAndMethod; nextPut: $;