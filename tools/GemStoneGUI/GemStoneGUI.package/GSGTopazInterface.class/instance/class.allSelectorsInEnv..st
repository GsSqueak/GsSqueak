new api - classes
class: classProxy allSelectorsInEnv: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: classProxy codeReferencingMe , ' selectorsForEnvironment: ' , envId).
	^ self convertToSymbolList: (topazOutput at: 1)