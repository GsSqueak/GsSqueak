initialize
openFileNamed: fileName
	file := MultiByteFileStream readOnlyFileNamed: fileName.
	file wantsLineEndConversion: true