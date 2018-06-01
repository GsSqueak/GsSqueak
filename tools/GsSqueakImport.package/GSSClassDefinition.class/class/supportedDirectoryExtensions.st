concretization
supportedDirectoryExtensions

	^ Array streamContents: [:stream |
		self subclassesDo: [:aClass |
			stream nextPutAll: aClass directoryExtensions]]