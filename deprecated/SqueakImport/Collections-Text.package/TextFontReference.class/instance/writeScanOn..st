fileIn/fileOut
writeScanOn: strm

	strm nextPut: self class scanCharacter.
	strm nextPutAll: font familyName; nextPut: $#.
	font height printOn: strm.