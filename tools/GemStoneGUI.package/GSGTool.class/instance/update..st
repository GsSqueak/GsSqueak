repository management
update: aSymbol

	aSymbol == #sessionClosed ifTrue: [self sessionClosed].
	super update: aSymbol