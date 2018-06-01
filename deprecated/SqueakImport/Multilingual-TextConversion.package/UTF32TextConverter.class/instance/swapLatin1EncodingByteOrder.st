private
swapLatin1EncodingByteOrder
	latin1Encodings := latin1Encodings collect: [:each | 
		each ifNotNil: [each reverse]]