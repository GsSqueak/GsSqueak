api
selectorsFor: class category: category env: envId

	| topazOutput |
	topazOutput := self run: (self codeForPrintingListCreatedBy: class , ' selectorsIn: #''' , category , ''' environmentId: ' , envId).
	^ self convertToSymbolList: (topazOutput at: 1)