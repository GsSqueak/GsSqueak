private
writeSegment
	"The current segment must be the last in the file."
	| compressedSegment |
	segmentFile position: (segmentTable at: segmentIndex).
	compressedSegment := ByteArray streamContents:
		[:strm | (GZipWriteStream on: strm) nextPutAll: collection asByteArray; close].
	segmentFile nextPutAll: compressedSegment.
	segmentTable at: segmentIndex + 1 put: segmentFile position.

	segmentFile position: 2 * 4.
	segmentFile nextNumber: 4 put: endOfFile.
	segmentFile position: (segmentIndex + 3) * 4.
	segmentFile nextNumber: 4 put: (segmentTable at: segmentIndex + 1).
	dirty := false