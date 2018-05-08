converting
byteComplement
	"return a character set containing precisely the single byte characters the receiver does not"
	
	^ ByteCharacterSet fromMap: (self byteArrayMap collect: [:i | 1 - i])
