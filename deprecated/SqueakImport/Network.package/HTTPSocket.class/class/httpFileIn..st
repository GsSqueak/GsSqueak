get the page
httpFileIn: url
	"Do a regular file-in of a file that is served from a web site.  If the file contains an EToy, then open it.  Might just be code instead.  tk 7/23/97 17:10"
	"Notes: To store a file on an HTTP server, use the program 'Fetch'.  After indicating what file to store, choose 'Raw Data' from the popup menu that has MacBinary/Text/etc.  Use any file extension as long as it is not one of the common ones.  The server does not have to know about the .sqo extension in order to send your file.  (We do not need a new MIME type and .sqo does not have to be registered with the server.)"
	"	HTTPSocket httpFileIn: 'www.webPage.com/~kaehler2/sample.etoy'	 "
	"	HTTPSocket httpFileIn: '206.18.68.12/squeak/car.sqo'	 "
	"	HTTPSocket httpFileIn: 'jumbo/tedk/sample.etoy'	 "

	| doc eToyHolder |
	doc := self httpGet: url accept: 'application/octet-stream'.
	doc isString ifTrue:
			[self inform: 'Cannot seem to contact the web site'].
	doc reset.
	eToyHolder := doc fileInObjectAndCode.

	eToyHolder ifNotNil: [eToyHolder open].
	"Later may want to return it, instead of open it"
