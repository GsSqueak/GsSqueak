private
createRequestFor: name in: aLoader
	"Create a URL request for the given string, which can be cached locally."
	| request |
	request := HTTPLoader httpRequestClass for: self baseURL , name in: aLoader.
	aLoader addRequest: request. "fetch from URL"
	^request