interface
systemCategories

	| query output |
	query := self codeForPrintingListCreatedBy: 
				'(' , self codeReferencingMe , ' allClasses collect: [:class | class category]) 
					asSet asArray sortAscending'.
	output := self session run: query.
	^ self convertToSymbolList: output first