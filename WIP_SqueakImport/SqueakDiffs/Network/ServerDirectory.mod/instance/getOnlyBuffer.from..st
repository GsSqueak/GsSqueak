up/download
getOnlyBuffer: buffer from: fileNameOnServer
	"Open ftp, fill the buffer, and close the connection.  Only first part of a very long file."

	| dataStream |
	client := self openFTPClient.
	dataStream := WriteStream on: buffer.
	[client getPartial: buffer size fileNamed: fileNameOnServer into: dataStream]
		ensure: [self quit].
	^buffer