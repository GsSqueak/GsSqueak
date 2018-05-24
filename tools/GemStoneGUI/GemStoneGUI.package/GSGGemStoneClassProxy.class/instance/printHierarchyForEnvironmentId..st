interface
printHierarchyForEnvironmentId: envId

	| query |
	query := '{1} hierarchy: {2}'
				format: {
					self codeReferencingMe.
					envId}.
	^ self repository fetchString: query