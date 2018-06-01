private
newFileNamed: fName inDirectory: aDirectory

	positionThusFar := 0.
	zippedFileStream := aDirectory newFileNamed: fName.
	zippedFileStream binary; setFileTypeToObject.
		"Type and Creator not to be text, so can be enclosed in an email"
	gZipStream := GZipWriteStream on: zippedFileStream.
