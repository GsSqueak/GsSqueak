interface
methodAt: aSymbol ifAbsent: aBlock

	| query |
	query := '{1} compiledMethodAt: {2} environmentId: {3} otherwise: nil'
				format: {
					self codeReferencingMe.
					aSymbol storeString.
					self environmentId}.
	^ (self fetchMethod: query) ifNil: [aBlock value]