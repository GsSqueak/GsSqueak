sources, changes log
saveChangesInFileNamed: aString
	| fullChangesName |
	fullChangesName := (FileDirectory default fullNameFor: aString).
	(FileDirectory default directoryNamed:(FileDirectory dirPathFor: fullChangesName )) assureExistence.
	FileDirectory default 
		copyFileWithoutOverwriteConfirmationNamed: self changesName 
		toFileNamed: fullChangesName.
	Smalltalk setMacFileInfoOn: fullChangesName.
