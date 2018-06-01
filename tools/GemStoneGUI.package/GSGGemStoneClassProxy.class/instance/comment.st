interface
comment

	| query |
	query := '{1} comment'
				format: {
					self codeReferencingInstanceSide}.
	^ self repository fetchString: query