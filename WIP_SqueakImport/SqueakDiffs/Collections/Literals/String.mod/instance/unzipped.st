*Compression-Streams
unzipped
	^self isByteString
		ifTrue: [self asByteArray unzipped asString]
		ifFalse: [self asByteArray unzipped asWideString]