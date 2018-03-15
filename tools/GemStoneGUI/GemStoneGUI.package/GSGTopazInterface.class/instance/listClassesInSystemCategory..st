commands
listClassesInSystemCategory: category

	self setEnv: 0.
	^ self run: (self codeForPrintingListCreatedBy: (self codeForGettingAllClassesInCategory: category))