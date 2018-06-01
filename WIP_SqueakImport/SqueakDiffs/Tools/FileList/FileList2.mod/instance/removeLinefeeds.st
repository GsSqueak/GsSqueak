own services
removeLinefeeds
	"Remove any line feeds by converting to CRs instead.  This is a temporary implementation for 3.6 only... should be removed during 3.7alpha."
	| fileContents |
	fileContents := ((FileStream readOnlyFileNamed: self fullName) wantsLineEndConversion: true) contentsOfEntireFile.
	(FileStream newFileNamed: self fullName) 
		nextPutAll: fileContents;
		close.