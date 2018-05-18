instance creation
fromFile: aFileName
	^self fromStream: (FileStream readOnlyFileNamed: aFileName)