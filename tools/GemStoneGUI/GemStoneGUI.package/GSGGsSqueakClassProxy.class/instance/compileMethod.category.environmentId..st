interface
compileMethod: aString category: aSymbol environmentId: envId

	| query |
	query := '({1}) newMethodFromSqueakString: {2} inEnv: {3} classified: {4}' format: {
				self codeReferencingMe.
				aString printString.
				envId.
				aSymbol asSymbol printString}.
	self repository executeString: query