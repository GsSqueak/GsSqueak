convenience
decodeToBytes: aStringOrStream
	" Analogous to Base64MimeConverter>>#mimeDecodeToBytes:"
	| expectedSize |
	expectedSize := aStringOrStream size * 4 // 5.
	^ (ByteArray new: expectedSize streamContents:
		[:stream |
			(self stringStream: aStringOrStream readStream dataStream: stream)
				decodeToByteArray]) readStream