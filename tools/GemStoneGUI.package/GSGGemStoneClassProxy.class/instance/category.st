interface
category

	| query |
	query := '{1} category'
				format: {
					self codeReferencingInstanceSide}.
	^ self repository fetchSymbol: query