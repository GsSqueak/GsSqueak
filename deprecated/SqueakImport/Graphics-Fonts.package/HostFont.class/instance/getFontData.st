accessing
getFontData
	| fontHandle bufSize buffer |
	fontHandle := self primitiveCreateFont: name size: pointSize emphasis: emphasis.
	fontHandle ifNil:[^nil].
	bufSize := self primitiveFontDataSize: fontHandle.
	buffer := ByteArray new: bufSize.
	self primitiveFont: fontHandle getData: buffer.
	^buffer