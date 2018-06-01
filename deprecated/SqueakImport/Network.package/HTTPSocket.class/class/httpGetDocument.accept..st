get the page
httpGetDocument: url accept: mimeType
	"Return the exact contents of a web object. Asks for the given MIME type. If mimeType is nil, use 'text/html'. The parsed header is saved. Use a proxy server if one has been registered.  tk 7/23/97 17:12"
	^self httpGetDocument: url args: nil accept: mimeType request: ''