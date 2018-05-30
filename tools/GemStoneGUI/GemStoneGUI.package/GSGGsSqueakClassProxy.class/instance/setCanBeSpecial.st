interface 2
setCanBeSpecial

	| query |
	query := '{1} _setSelfCanBeSpecial'
				format: {
					self codeReferencingMe}.
	self repository executeString: query.