paths
pathString
	"Path as it appears in a URL with $/ as delimiter."
	
	^String streamContents: [ :s |
		"isAbsolute ifTrue:[ s nextPut: $/ ]."
		self path
			do: [ :p | s nextPutAll: p encodeForHTTP ]
			separatedBy: [ s nextPut: $/]]