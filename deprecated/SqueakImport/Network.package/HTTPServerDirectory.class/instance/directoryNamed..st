accessing
directoryNamed: localFileName
	| newDir |
	newDir := super directoryNamed: localFileName.
	newDir altUrl: (self altUrl , '/' , localFileName).
	^newDir