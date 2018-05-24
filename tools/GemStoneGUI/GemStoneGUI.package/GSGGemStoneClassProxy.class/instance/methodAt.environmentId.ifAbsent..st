interface
methodAt: aSymbol environmentId: envId ifAbsent: aBlock

	| query |
	query := '{1} compiledMethodAt: {2} environmentId: {3} otherwise: nil'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					envId}.
	^ (self fetchMethod: query) ifNil: [aBlock value]