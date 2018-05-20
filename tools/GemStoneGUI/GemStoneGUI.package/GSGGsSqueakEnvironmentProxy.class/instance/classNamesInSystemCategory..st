interface
classNamesInSystemCategory: aSymbol

	| query |
	query :=  '{1} allClasses select: [:class | 
					class category = {2}]'
				format: {
					self codeReferencingMe.
					aSymbol asString printString}.
	^ self repository fetchArrayOfSymbols: query