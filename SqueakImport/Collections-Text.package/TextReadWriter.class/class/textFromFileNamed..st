instance creation
textFromFileNamed: fileName

	^ self textFromStream: (FileStream readOnlyFileNamed: fileName)