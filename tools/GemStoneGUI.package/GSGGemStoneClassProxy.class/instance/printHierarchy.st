interface
printHierarchy

	| query |
	query := '{1} hierarchy: {2}'
				format: {
					self codeReferencingMe.
					self environmentId}.
	^ self repository fetchString: query