*SqCollectionLiterals-*SqByteArray-converting
ascii85Encoded
	"Encode the receiver as Ascii85"
	"'Hello World' asByteArray ascii85Encoded"

	^ (Ascii85Converter encode: self readStream) contents
