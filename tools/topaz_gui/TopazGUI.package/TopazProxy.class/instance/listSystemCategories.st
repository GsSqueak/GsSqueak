commands
listSystemCategories

	self setEnv: 0.
	^ self run: (self codeForPrintingListCreatedBy: 'ClassOrganizer cachedOrganizer categories keys asArray sortAscending')