*network-uri
fullPathForURI: aURI
	^self activeDirectoryClass privateFullPathForURI: (FileDirectory default uri resolveRelativeURI: aURI)