objects from disk
writeOn: aByteStream
	"Write quickly and disregard the endianness of the words.  Store the array of bits onto the argument, aStream.  (leading byte ~= 16r80) identifies this as raw bits (uncompressed)."

	aByteStream nextInt32Put: self size.	"4 bytes"
	aByteStream nextPutAll: self
