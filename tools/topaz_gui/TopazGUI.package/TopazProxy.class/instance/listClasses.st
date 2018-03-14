commands
listClasses

	self setEnv: 0.
	^ self run: (self codeForPrintingListCreatedBy: 'ClassOrganizer new classes')