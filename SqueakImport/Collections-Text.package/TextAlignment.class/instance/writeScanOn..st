fileIn/fileOut
writeScanOn: strm

	strm nextPut: self class scanCharacter.
	alignment printOn: strm.