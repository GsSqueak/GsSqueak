interface
renameMessageCategory: oldSymbol to: newSymbol environmentId: envId

	| query |
	query := '{1} renameMessageCategory: {2} to: {3} environmentId: {4}'
				format: {
					self codeReferencingMe.
					oldSymbol storeString.
					newSymbol storeString.
					envId}.
	self repository executeString: query