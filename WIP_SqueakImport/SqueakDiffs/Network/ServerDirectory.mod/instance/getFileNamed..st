up/download
getFileNamed: fileNameOnServer
	"Just FTP a file from a server.  Return contents.
	(Later -- Use a proxy server if one has been registered.)"

	| result |
	client := self openFTPClient.
	result := [client getFileNamed: fileNameOnServer]
		ensure: [self quit].
	^result