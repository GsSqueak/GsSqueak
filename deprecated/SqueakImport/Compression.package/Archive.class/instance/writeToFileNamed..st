archive operations
writeToFileNamed: aFileName
	| stream |
	"Catch attempts to overwrite existing zip file"
	(self canWriteToFileNamed: aFileName)
		ifFalse: [ ^self error: (aFileName, ' is needed by one or more members in this archive') ].
	stream := StandardFileStream forceNewFileNamed: aFileName.
	self writeTo: stream.
	stream close.