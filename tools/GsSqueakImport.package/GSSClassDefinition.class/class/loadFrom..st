instance creation
loadFrom: aFileDirectory

	| extension |
	extension := aFileDirectory directoryEntry extension.
	^ (self concreteClassForExtension: extension) new
		setDirectory: aFileDirectory;
		loadFromDirectory