interface
removeMessageCategory: aSymbol environmentId: envId

	| query |
	query := '{1} removeCategory: {2} environmentId: {3}'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					envId}.
	self repository executeString: query