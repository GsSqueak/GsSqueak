file in/out
url
	| firstURL |
	"compose my url on the server"

	urlList isEmptyOrNil ifTrue: [^''].
	firstURL := urlList first.
	firstURL isEmpty
		ifFalse: [
			firstURL last == $/
				ifFalse: [firstURL := firstURL, '/']].
	^ firstURL, self versionedFileName
