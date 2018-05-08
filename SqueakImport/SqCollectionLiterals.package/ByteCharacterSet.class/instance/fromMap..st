initialize-release
fromMap: aByteArray
	byteArrayMap := aByteArray.
	tally := aByteArray count: [:e | e = 1]
