fileIn/fileOut
writeScanOn: strm

	strm nextPut: self class scanCharacter; nextPutAll: url; nextPut: $;