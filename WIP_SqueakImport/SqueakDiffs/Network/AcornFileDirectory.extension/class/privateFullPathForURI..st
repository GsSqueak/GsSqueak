*network-uri
privateFullPathForURI: aURI
	"derive the full filepath from aURI"
	| path |
	path := String streamContents: [ :s |
		aURI pathComponents
			do: [ :p |	s nextPutAll: p ]
			separatedBy: [ s nextPut: self pathNameDelimiter ].
	].
	^path unescapePercents
