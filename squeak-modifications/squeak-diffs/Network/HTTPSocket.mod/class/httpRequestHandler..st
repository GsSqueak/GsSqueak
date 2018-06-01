handler
httpRequestHandler: anObject
	"Set the registered handler for http requests. The handler needs to implement 
	#httpRequest:url:headers:content:response: compatible with the baseline version
	in HTTPSocket."

	HTTPRequestHandler := anObject