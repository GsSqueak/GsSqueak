interface
classNamesInSystemCategory: aSymbol

	| query |
	query := '({1} categories at: {2} ifAbsent: [#()])
				collect: [:class | class name asSymbol]'
				format: {
					(self codeForClassOrganizerInEnv: 0).
					aSymbol storeString}.
	^ (self repository fetchArrayOfSymbols: query) sort