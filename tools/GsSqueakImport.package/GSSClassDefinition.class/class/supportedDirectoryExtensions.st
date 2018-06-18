concretization
supportedDirectoryExtensions

	^ Array streamContents: [:stream |
		self allSubclassesDo: [:aClass |
			stream nextPutAll: aClass directoryExtensions]]