*network-uri
contentStreamForURI: aURI
	| fullPath fileDir |
	fullPath := self fullPathForURI: aURI.
	fileDir := self forFileName: fullPath.
"	^fileDir readOnlyFileNamed: (self localNameFor: fullPath)"
	^StandardFileStream readOnlyFileNamed: fullPath
