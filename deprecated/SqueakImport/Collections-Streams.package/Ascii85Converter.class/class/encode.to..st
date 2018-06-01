convenience
encode: aCollectionOrStream to: outStream

	^ (self stringStream: outStream dataStream: aCollectionOrStream readStream)
		encode