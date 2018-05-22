interface
addMessageCategory: aSymbol environmentId: envId

	| query |
	query := '{1} addCategory: {2} environmentId: {3}'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					envId}.
	self repository executeString: query