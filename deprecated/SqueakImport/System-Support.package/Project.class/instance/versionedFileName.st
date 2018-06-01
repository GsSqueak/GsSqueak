file in/out
versionedFileName
	"Project current versionedFileName"
	^String streamContents:[:s|
		s nextPutAll: self name.
		s nextPutAll: FileDirectory dot.
		s nextPutAll: self versionForFileName.
		s nextPutAll: FileDirectory dot.
		s nextPutAll: self projectExtension.
	]
