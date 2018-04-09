*SqCollectionLiterals-converting
ascii85DecodedAs: aClass
	"Decode the receiver from Ascii85"
	"'<~87cURD]i,""Ebo7~>' ascii85DecodedAs: String"

	^ Ascii85Converter decode: self as: aClass
