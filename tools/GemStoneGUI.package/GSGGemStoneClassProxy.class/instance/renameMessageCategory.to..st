interface
renameMessageCategory: oldSymbol to: newSymbol

	| query |
	query := '{1} renameCategory: {2} to: {3} environmentId: {4}'
				format: {
					self codeReferencingMe.
					oldSymbol storeString.
					newSymbol storeString.
					self environmentId}.
	self repository executeString: query