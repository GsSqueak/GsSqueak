get the page
httpGet: url args: args accept: mimeType request: requestString
	"Return the exact contents of a web object. Asks for the given MIME type. If mimeType is nil, use 'text/html'. The parsed header is saved. Use a proxy server if one has been registered.  tk 7/23/97 17:12"
	"Note: To fetch raw data, you can use the MIME type 'application/octet-stream'."

	| document |
	document := self httpGetDocument: url  args: args  accept: mimeType request: requestString.
	(document isString) ifTrue: [
		"strings indicate errors"
		^ document ].

	^ (RWBinaryOrTextStream with: document content) reset
