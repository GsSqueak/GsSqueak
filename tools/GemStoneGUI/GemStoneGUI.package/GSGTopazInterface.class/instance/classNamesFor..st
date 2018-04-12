new api - environments
classNamesFor: environmentProxy

	| code topazOutput symbolList |
	code := self codeForPrintingListCreatedBy: 
				 (self codeForClassOrganizerOn: environmentProxy env: 0) , 
					' classes collect: [:class | class name]'.
	topazOutput := self run: code.
	^ symbolList := self convertToSymbolList: topazOutput first