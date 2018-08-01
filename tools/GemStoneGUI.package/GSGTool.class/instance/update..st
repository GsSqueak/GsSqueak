repository management
update: aSymbol

	aSymbol == #repositoryClosed ifTrue: [self close].
	super update: aSymbol