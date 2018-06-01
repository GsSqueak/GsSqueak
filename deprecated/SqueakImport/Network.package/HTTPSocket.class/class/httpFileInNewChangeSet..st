get the page
httpFileInNewChangeSet: url
	"Do a regular file-in of a file that is served from a web site.  Put it into a new changeSet."
	"Notes: To store a file on an HTTP server, use the program 'Fetch'.  After indicating what file to store, choose 'Raw Data' from the popup menu that has MacBinary/Text/etc.  Use any file extension as long as it is not one of the common ones."
	"	HTTPSocket httpFileInNewChangeSet: '206.18.68.12/squeak/updates/83tk:=test.cs'	 "

	| doc |
	doc := self httpGet: url accept: 'application/octet-stream'.
	doc isString ifTrue:
			[self inform: 'Cannot seem to contact the web site'].
	doc reset.
	ChangeSet newChangesFromStream: doc
				named: (url findTokens: '/') last.