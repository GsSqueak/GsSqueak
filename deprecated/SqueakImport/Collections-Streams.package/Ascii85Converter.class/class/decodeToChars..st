convenience
decodeToChars: aStringOrStream
	" Analogous to Base64MimeConverter>>#mimeDecodeToChars:"
	| expectedSize |
	expectedSize := aStringOrStream size * 4 // 5.
	^ (String new: expectedSize streamContents:
		[:stream | self decode: aStringOrStream to: stream]) readStream