new api - environments
allSystemCategoriesFor: environmentProxy

	| code topazOutput |
	code := self codeForPrintingListCreatedBy: 
				(self codeForClassOrganizerOn: environmentProxy env: 0) , 
					' categories keys asArray sortAscending'.
	self setEnv: 0.
	topazOutput := self run: code.
	^ self convertToSymbolList: (topazOutput at: 1)