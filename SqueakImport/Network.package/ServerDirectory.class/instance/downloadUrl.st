accessing
downloadUrl
	"The url under which files will be accessible."
	^(self altUrl
		ifNil: [self realUrl]
		ifNotNil: [self altUrl]) , '/'