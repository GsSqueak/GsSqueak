get the page
httpGet: url accept: mimeType
	"Return the exact contents of a web object. Asks for the given MIME type. If mimeType is nil, use 'text/html'. The parsed header is saved. Use a proxy server if one has been registered.
	Note: To fetch raw data, you can use the MIME type 'application/octet-stream'.  To accept anything, use '*/*'."

	^self httpGet: url  args: nil accept: mimeType