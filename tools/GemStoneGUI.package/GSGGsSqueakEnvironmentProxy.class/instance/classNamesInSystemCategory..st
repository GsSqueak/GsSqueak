interface
classNamesInSystemCategory: aSymbol

	| query |
	query :=  '({1} allClasses select: [:class | 
					class category asSymbol = {2}])
					collect: [:class | class @env{3}: name asSymbol]'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					self environmentId}.
	^ self repository fetchArrayOfSymbols: query