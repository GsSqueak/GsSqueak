write and read
readWordArrayForSegment
	"Read the contents of a WordArray ignoring endianness."

	^ WordArrayForSegment newFromStream: byteStream
	"Size is number of long words."