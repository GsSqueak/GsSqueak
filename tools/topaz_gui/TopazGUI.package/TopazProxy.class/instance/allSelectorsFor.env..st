api
allSelectorsFor: class env: envId

	| topazOutput |
	topazOutput := self run: (self codeForPrintingListCreatedBy: class , ' selectorsForEnvironment: ' , envId).
	^ self convertToSymbolList: (topazOutput at: 1)