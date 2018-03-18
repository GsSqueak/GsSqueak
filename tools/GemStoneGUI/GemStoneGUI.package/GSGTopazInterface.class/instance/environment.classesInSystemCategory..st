new api - environments
environment: environmentProxy classesInSystemCategory: categoryName

	| code topazOutput |
	code := self codeForPrintingListCreatedBy: 
				(self codeForClassOrganizerOn: environmentProxy) , 
					' categories at: #''' , categoryName , ''' ifAbsent: [#()]'.
	self setEnv: 0.
	topazOutput := self run: code.
	^ (self convertToSymbolList: (topazOutput at: 1)) sort