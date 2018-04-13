interface
classNamesInSystemCategory: aSymbol

	| query |
	query := (self codeForClassOrganizerInEnv: 0) , ' 
				categories at: ' , aSymbol printString , ' ifAbsent: [#()]'.
	^ (self fetchArrayOfSymbols: query) sort