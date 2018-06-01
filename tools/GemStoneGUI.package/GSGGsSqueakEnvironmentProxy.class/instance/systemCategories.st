interface
systemCategories

	| query |
	query := '({1} allClasses collect: [:class | class category asSymbol]) 
					asSet asArray sortAscending'
					format: {
						self codeReferencingMe}.
	^ self repository fetchArrayOfSymbols: query