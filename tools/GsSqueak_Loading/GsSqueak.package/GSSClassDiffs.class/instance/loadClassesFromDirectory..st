initialization
loadClassesFromDirectory: aFileDirectory

	aFileDirectory entriesDo: [:entry |
		entry isDirectory ifTrue: [
			(self isClassDirectoryExtension: entry extension)
				ifTrue: [	self loadClassDefinitionFrom: entry asFileDirectory]
				ifFalse: [self loadClassesFromDirectory: entry asFileDirectory]]]