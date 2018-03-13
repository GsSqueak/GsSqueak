commands
listSymbolDictionaries

	self setEnv: 0.
	^ self run: (self codeForPrintingListCreatedBy: 'System myUserProfile symbolList names')