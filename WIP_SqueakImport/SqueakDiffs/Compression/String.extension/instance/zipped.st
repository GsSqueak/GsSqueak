*Compression-Streams
zipped
	"This sounds questionnable for WideString but works - even if zipped size is not a multiple of 4"
	| zipped |
	zipped := self asByteArray zipped.
	self isByteString ifTrue: [^zipped asString].
	zipped size \\ 4 = 0 ifTrue: [^zipped asWideString].
	^(zipped , (ByteArray new: 4 - (zipped size \\ 4))) asWideString