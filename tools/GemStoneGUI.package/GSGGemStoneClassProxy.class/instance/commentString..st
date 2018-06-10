interface
commentString: aString

	| query |
	query := '{1} comment: {2}'
				format: {
					self codeReferencingInstanceSide.
					aString storeString}.
	self repository executeString: query