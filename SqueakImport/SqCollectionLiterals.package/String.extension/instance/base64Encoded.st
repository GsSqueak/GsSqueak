*SqCollectionLiterals-converting
base64Encoded
	"Encode the receiver as base64"
	"'Hello World' base64Encoded"

	^(Base64MimeConverter
		mimeEncode: (ReadStream on: self)
		multiLine: false) contents