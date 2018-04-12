message list
methodNamed: aSymbol

	^ self selectedClassOrMetaClass
			methodAt: aSymbol
			environmentId: self environmentId
			ifAbsent: [nil]