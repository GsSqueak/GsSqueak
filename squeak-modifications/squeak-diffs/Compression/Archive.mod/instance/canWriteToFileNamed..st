archive operations
canWriteToFileNamed: aFileName
	"Catch attempts to overwrite existing zip file"
	^members noneSatisfy: [ :ea | ea usesFileNamed: aFileName ].
