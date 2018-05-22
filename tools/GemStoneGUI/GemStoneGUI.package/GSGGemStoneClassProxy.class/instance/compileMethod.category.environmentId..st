interface
compileMethod: aString category: aSymbol environmentId: envId

	| query |
	query := '({1}
				compileMethod: {2}
				dictionaries: {3}
				category: {4}
				environmentId: {5}) selector'
					format: {
						self codeReferencingMe.
						aString storeString.
						self environment codeReferencingSymbolList.
						aSymbol storeString.
						envId}.
	^ self repository fetchSymbol: query