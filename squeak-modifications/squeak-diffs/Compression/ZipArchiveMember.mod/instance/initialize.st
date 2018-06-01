initialization
initialize
	super initialize.
	lastModFileDateTime := 0.
	fileAttributeFormat := FaUnix.
	versionMadeBy := 20.
	versionNeededToExtract := 20.
	bitFlag := 0.
	compressionMethod := CompressionStored.
	desiredCompressionMethod := CompressionDeflated.
	desiredCompressionLevel := CompressionLevelDefault.
	internalFileAttributes := 0.
	externalFileAttributes := 0.
	fileName := ''.
	cdExtraField := ''.
	localExtraField := ''.
	fileComment := ''.
	crc32 := 0.
	compressedSize := 0.
	uncompressedSize := 0.
	self unixFileAttributes: DefaultFilePermissions.