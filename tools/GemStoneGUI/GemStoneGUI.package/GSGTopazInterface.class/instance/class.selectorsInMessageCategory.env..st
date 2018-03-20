new api - classes
class: classProxy selectorsInMessageCategory: categoryName env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: 
								classProxy codeReferencingMe , ' selectorsIn: #''' , categoryName , ''' environmentId: ' , envId).
	^ self convertToSymbolList: topazOutput first