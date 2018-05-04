util
highBitOfBytes: aBytesOop 
	^ self cDigitHighBit: (interpreterProxy firstIndexableField: aBytesOop)
		len: (self byteSizeOfBytes: aBytesOop)