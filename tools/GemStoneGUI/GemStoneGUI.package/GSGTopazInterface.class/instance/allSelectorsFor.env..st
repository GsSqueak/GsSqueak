api
allSelectorsFor: class env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: class , ' selectorsForEnvironment: ' , envId).
	^ self convertToSymbolList: (topazOutput at: 1)