interface
definition

	| query |
	query := '{1} definition'
				format: {
					self codeReferencingInstanceSide}.
	^ self repository fetchString: query