convenience
decode: aStringOrStream to: outStream

	^ (self stringStream: aStringOrStream readStream dataStream: outStream)
		decode