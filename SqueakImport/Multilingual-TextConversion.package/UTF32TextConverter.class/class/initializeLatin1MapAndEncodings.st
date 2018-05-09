utilities
initializeLatin1MapAndEncodings
	"Initialize the latin1Map and latin1Encodings.
	These variables ensure that conversions from latin1 ByteString is reasonably fast"
	
	latin1Map := (ByteArray new: 256) atAllPut: 1.
	latin1Encodings := (0 to: 255) collect: [:i | (ByteArray newFrom: {0 . 0 . 0 . i}) asString]