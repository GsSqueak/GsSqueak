accessing
useLittleEndian: aBoolean

	aBoolean = useLittleEndian ifFalse: [ self swapLatin1EncodingByteOrder ].
	useLittleEndian := aBoolean.
