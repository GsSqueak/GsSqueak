get the page
httpGetDocument: url args: args accept: mimeType
	"Return the exact contents of a web object. Asks for the given MIME type. If mimeType is nil, use 'text/html'. The parsed header is saved. Use a proxy server if one has been registered.  Note: To fetch raw data, you can use the MIME type 'application/octet-stream'."

	^ self httpGetDocument: url args: args accept: mimeType request: ''