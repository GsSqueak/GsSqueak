file list
readOnlyStream
	"Answer a read-only stream on the selected file. For the various stream-reading services."

	^self directory ifNotNil: [ :dir | dir readOnlyFileNamed: self fileName ]