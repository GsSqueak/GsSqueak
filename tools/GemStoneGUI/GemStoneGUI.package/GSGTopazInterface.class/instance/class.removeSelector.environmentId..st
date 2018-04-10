new api - classes
class: classProxy removeSelector: aSymbol environmentId: envId

	| query topazOutput |
	query := classProxy codeReferencingMe , 
				' removeSelector: ' , aSymbol printString ,
				' environmentId: ' , envId.
	topazOutput := self run: query