reading
contentsFrom: start to: finish
	"Answer part of my contents as a string - assuming a Latin1 encoding.."
	| s |
	s := (ByteArray new: finish - start + 1) writeStream.
	self extractTo: s from: start to: finish.
	^s contents asString