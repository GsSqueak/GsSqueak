fileIn/fileOut
writeAsMimeString

	| fileName fileStream tmpStream |
	tmpStream := MultiByteBinaryOrTextStream on: ''.
	tmpStream converter: UTF8TextConverter new.
	self fileOutOn: tmpStream.

	fileName := id isoString, '.translation.gz.mime'.
	fileStream := FileStream newFileNamed: fileName.
	fileStream nextPutAll: tmpStream contents asByteArray zipped base64Encoded.
	fileStream close.
