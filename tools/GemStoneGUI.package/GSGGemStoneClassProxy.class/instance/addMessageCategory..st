interface
addMessageCategory: aSymbol

	| query |
	query := '{1} addCategory: {2} environmentId: {3}'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					self environmentId}.
	self repository executeString: query