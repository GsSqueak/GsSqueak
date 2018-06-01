reading
contents
	"Answer my contents as a string - assuming a Latin1 encoding."
	| s |
	s := (ByteArray new: self uncompressedSize) writeStream.
	self extractTo: s.
	^s contents asString