up/download
getDirectory
	"Return a stream with a listing of the current server directory.  (Later -- Use a proxy server if one has been registered.)"

	| listing |
	client := self openFTPClient.
	listing := 
		[ self switchDirectory.
		client getDirectory]
			ensure: [self quit].
	^ReadStream on: listing