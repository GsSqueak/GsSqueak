resources
resourceDirectoryName
	"Project current resourceDirectoryName"
	^String streamContents:[:s|
		s nextPutAll: self name.
		s nextPutAll: FileDirectory dot.
		s nextPutAll: self versionForFileName.
	]
