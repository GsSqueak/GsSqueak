message list
methodNamed: aSymbol

	^ self selectedClassOrMetaClass
			methodAt: aSymbol
			ifAbsent: [nil]