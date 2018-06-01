interface
category: aSymbol

	| query |
	query := '{1} category: {2}'
				format: {
					self codeReferencingInstanceSide.
					aSymbol storeString}.
	self repository executeString: query