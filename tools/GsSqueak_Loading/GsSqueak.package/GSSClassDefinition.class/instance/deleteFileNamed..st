fileout
deleteFileNamed: aString

	(self fileDirectory entryAt: aString ifAbsent: [^ self]) delete.