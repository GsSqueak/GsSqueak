initialization
from: aFileName
	| entry |
	compressionMethod := CompressionStored.
	"Now get the size, attributes, and timestamps, and see if the file exists"
	stream := StandardFileStream readOnlyFileNamed: aFileName.
	self localFileName: (externalFileName := stream name).
	entry := stream directoryEntry.
	compressedSize := uncompressedSize := entry fileSize.
	desiredCompressionMethod := compressedSize > 0 ifTrue: [ CompressionDeflated ] ifFalse: [ CompressionStored ].
	self setLastModFileDateTimeFrom: entry modificationTime.
	stream close