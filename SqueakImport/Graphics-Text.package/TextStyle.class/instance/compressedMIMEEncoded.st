mime file in/out
compressedMIMEEncoded
	"Answer a String with my compressed, stored representation as Base64"

	| s ff |
	self fontArray do: [:f | f releaseCachedState].
	s := RWBinaryOrTextStream on: ''.
	ff := SmartRefStream on: s reset.
	TextConstants at: #forceFontWriting put: true.
	[ff nextPut: self] 
		ensure: [TextConstants at: #forceFontWriting put: false].
	^s contents asByteArray zipped base64Encoded