handler
httpRequestHandler
	"Answer the registered handler for http requests. The handler needs to implement 
	#httpRequest:url:headers:content:response: compatible with the baseline version
	in HTTPSocket. If no handler is registered, answer the receiver"

	^HTTPRequestHandler ifNil:[self]