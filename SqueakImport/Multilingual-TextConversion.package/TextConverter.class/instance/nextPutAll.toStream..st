conversion
nextPutAll: aString toStream: aStream
	"Handle fast conversion if ByteString"
	
	^self next: aString size putAll: aString startingAt: 1 toStream: aStream