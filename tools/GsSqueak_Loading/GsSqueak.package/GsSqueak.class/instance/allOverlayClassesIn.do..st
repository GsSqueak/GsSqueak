loading - overlay classes
allOverlayClassesIn: aFileDirectory do: aBlock

	aFileDirectory entriesDo: [:entry |
		entry isDirectory ifTrue: [
			(self isClassDirectoryExtension: entry extension)
				ifTrue: [aBlock value: (GSSClassDefinition loadFrom: entry asFileDirectory)]
				ifFalse: [self allOverlayClassesIn: entry asFileDirectory do: aBlock]]]