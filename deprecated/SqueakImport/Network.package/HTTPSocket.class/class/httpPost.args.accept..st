get the page
httpPost: url  args: argsDict accept: mimeType 
	"like httpGET, except it does a POST instead of a GET.  POST allows data to be uploaded"
	| document |
	document := self httpPostDocument: url  args: argsDict  accept: mimeType  request: ''.
	(document isString) ifTrue: [ 
		"strings indicate errors"
		^document ].

	
	^RWBinaryOrTextStream with: document content