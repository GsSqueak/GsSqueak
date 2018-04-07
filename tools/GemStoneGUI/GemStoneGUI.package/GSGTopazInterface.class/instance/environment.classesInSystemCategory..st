new api - environments
environment: environmentProxy classesInSystemCategory: categoryName

	| code topazOutput |
	code := self codeForPrintingListCreatedBy: 
				(self codeForClassOrganizerOn: environmentProxy env: 0) , 
					' categories at: ' , categoryName printString , ' ifAbsent: [#()]'.
	self setEnv: 0.
	topazOutput := self run: code.
	^ (self convertToSymbolList: (topazOutput at: 1)) sort