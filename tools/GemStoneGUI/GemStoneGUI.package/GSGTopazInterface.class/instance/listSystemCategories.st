commands
listSystemCategories

	self setEnv: 0.
	^ self run: (self codeForPrintingListCreatedBy: 'ClassOrganizer new categories keys asArray sortAscending')