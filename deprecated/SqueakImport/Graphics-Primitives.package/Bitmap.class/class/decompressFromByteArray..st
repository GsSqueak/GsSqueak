instance creation
decompressFromByteArray: byteArray
	| s bitmap size |
	s := ReadStream on: byteArray.
	size := self decodeIntFrom: s.
	bitmap := self new: size.
	bitmap decompress: bitmap fromByteArray: byteArray at: s position+1.
	^ bitmap