conversion
encodeByteString: aByteString
	"Convert the given string from UTF-8 using the fast path if converting to Latin-1"

	| outStream lastIndex nextIndex |
	lastIndex := 1.
	(nextIndex := ByteString findFirstInString: aByteString inSet: latin1Map startingAt: lastIndex) = 0
		ifTrue: [ ^aByteString ].
	outStream := (String new: aByteString size + 1) writeStream.
	[
		outStream 
			next: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex;
			nextPutAll: (latin1Encodings at: (aByteString byteAt: nextIndex) + 1).
		lastIndex := nextIndex + 1.
		(nextIndex := ByteString findFirstInString: aByteString inSet: latin1Map startingAt: lastIndex) = 0 ] whileFalse.
	^outStream 
		next: aByteString size - lastIndex + 1 putAll: aByteString startingAt: lastIndex;
		contents