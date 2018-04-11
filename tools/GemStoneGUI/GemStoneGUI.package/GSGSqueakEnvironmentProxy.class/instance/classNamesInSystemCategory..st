interface
classNamesInSystemCategory: aSymbol

	| query output |
	query := self codeForPrintingListCreatedBy: 
				self codeReferencingMe , ' allClasses select: [:class | 
					class category = ' , aSymbol asString printString , ']'.
	output := self session run: query.
	^ self convertToSymbolList: output first