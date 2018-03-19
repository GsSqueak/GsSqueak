new api - classes
allInstVarNamesFor: classProxy

	| topazOutput |
	topazOutput :=  self run: (self codeForPrintingListCreatedBy: classProxy codeReferencingMe, ' allInstVarNames').
	^ self convertToSymbolList: topazOutput first