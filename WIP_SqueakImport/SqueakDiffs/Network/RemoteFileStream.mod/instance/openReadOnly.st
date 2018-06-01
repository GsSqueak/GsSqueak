as yet unclassified
openReadOnly
	"If we have data, don't reread."

	self readOnly.
	readLimit := readLimit max: position.
	localDataValid ifFalse: [remoteFile getFileNamed: remoteFile fileName into: self].
		"sets localDataValid := true"