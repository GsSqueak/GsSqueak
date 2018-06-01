interface
superclassName

	| query |
	query := '({1} superclassForEnv: {2}) @env{2}: name'
				format: {
					self codeReferencingMe.
					self environmentId}.
	^ self repository fetchSymbol: query