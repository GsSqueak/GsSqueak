interface
compileMethod: aString category: aSymbol

	| query |
	query := '({1}) newMethodFromSqueakString: {2} inEnv: {3} classified: {4}' format: {
				self codeReferencingMe.
				aString printString.
				7.
				aSymbol asSymbol printString}.
	self repository executeString: query