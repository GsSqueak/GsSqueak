new api - classes
class: classProxy messageCategoriesInEnv: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: 
								'(' , classProxy codeReferencingMe , ' _unifiedCategorys: ' , envId , ') keys').
	^ self convertToSymbolList: (topazOutput at: 1)