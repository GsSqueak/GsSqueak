new api - environments
allClassesFor: environmentProxy

	| code topazOutput symbolList |
	code := self codeForPrintingListCreatedBy: 
				 (self codeForClassOrganizerOn: environmentProxy) , 
					' classes'.
	self setEnv: 0.
	topazOutput := self run: code.
	symbolList := self convertToSymbolList: topazOutput first.
	^ symbolList 
		collect: [:className | self classProxyNamed: className 
								inEnvironment: environmentProxy] 
		as: Array