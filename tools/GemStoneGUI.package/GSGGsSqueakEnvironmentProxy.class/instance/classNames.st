interface
classNames

	| query |
	query := '{1} classNames'
				format: {
					self codeReferencingMe}.
	^ self repository fetchArrayOfSymbols: query