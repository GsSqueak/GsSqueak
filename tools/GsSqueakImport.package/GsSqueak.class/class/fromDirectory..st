instance creation
fromDirectory: aFileDirectory

	^ self new
		fileDirectory: aFileDirectory;
		loadClassDefinitions;
		yourself