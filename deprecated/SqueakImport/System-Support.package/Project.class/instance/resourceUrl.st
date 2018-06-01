resources
resourceUrl
	"compose my base url for resources on the server"
	| firstURL | 
"
	primaryServer := self primaryServerIfNil: [^''].
	firstURL := primaryServer altUrl ifNil: [primaryServer url]."
	firstURL := self downloadUrl.
	firstURL isEmpty
		ifFalse: [firstURL last == $/ ifFalse: [firstURL := firstURL, '/']].
	^ firstURL, self resourceDirectoryName , '/'
