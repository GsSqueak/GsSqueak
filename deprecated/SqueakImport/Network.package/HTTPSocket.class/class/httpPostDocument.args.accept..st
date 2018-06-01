get the page
httpPostDocument: url  args: argsDict accept: mimeType 
	"like httpGET, except it does a POST instead of a GET.  POST allows data to be uploaded"

	^ self httpPostDocument: url args: argsDict accept: mimeType request: ''
