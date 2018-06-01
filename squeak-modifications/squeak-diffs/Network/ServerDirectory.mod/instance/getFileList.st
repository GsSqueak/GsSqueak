up/download
getFileList
	"Return a stream with a list of files in the current server directory.  (Later -- Use a proxy server if one has been registered.)"

	| listing |
	client := self openFTPClient.
	listing := [client getFileList]
		ensure: [self quit].
	^ReadStream on: listing