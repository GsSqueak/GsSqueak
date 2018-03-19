new api - environments
allClassesFor: environmentProxy

	| code topazOutput |
	code := self codeForPrintingListCreatedBy: 
				 (self codeForClassOrganizerOn: environmentProxy) , 
					' classes'.
	self setEnv: 0.
	topazOutput := self run: code.
	^ self convertToSymbolList: (topazOutput at: 1)