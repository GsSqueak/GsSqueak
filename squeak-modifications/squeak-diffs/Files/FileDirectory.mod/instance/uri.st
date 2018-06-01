*network-uri
uri
	"Convert my path into a file:// type url.  Use slash instead of the local delimiter (:), and convert odd characters to %20 notation."

	"If slash (/) is not the file system delimiter, encode slashes before converting."
	| list |
	list := self pathParts.
	^(String streamContents: [:strm |
		strm nextPutAll: 'file:'.
		list do: [:each | strm nextPut: $/; nextPutAll: each encodeForHTTP].
		strm nextPut: $/]) asURI