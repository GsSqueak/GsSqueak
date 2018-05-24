interface
classNamesInSystemCategory: aSymbol

	| query |
	query :=  '({1} allClasses select: [:class | 
					class category = {2}])
					collect: [:class | class name asSymbol]'
				format: {
					self codeReferencingMe.
					aSymbol storeString}.
	^ self repository fetchArrayOfSymbols: query