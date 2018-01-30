mime file in/out
compressedMIMEEncoded
	"Answer a String with my compressed, stored representation as
	Base64 "
	| _gsSqueakTemp_s _gsSqueakTemp_ff |
	self fontArray
		do: [:f | f releaseCachedState].
	_gsSqueakTemp_s := RWBinaryOrTextStream on: ''.
	_gsSqueakTemp_ff := SmartRefStream on: _gsSqueakTemp_s reset.
	TextConstants at: #forceFontWriting put: true.
	[_gsSqueakTemp_ff nextPut: self]
		ensure: [TextConstants at: #forceFontWriting put: false].
	^ _gsSqueakTemp_s contents asByteArray zipped base64Encoded