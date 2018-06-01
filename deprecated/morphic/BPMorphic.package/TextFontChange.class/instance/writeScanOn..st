fileIn/fileOut
writeScanOn: strm 
	strm nextPut: self class scanCharacter.
	fontNumber printOn: strm