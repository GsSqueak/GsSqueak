interface
removeSelector: aSymbol

	| query |
	query := '{1} removeSeletor: {2} environmentId: {3}'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					self environmentId}.
	self repository executeString: query