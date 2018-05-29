interface 2
initializeClass

	| query |
	query := '{1} @env{2}: initialize'
				format: {
					self codeReferencingMe.
					self environmentId}.
	self repository executeString: query