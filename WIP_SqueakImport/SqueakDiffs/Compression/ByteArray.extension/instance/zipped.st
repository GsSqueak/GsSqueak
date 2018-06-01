*Compression-Streams
zipped
	| stream gzstream |
	stream := (ByteArray new: self size // 5) writeStream.
	gzstream := GZipWriteStream on: stream.
	gzstream nextPutAll: self.
	gzstream close.
	^stream contents