interface
compileMethod: aString category: aSymbol environmentId: envId

	| query |
	aString size > 100000 ifTrue: [
		^ self notify: ('Method {1} >> {2} too long. Can''t do that with the current implementation of TopazInterface'
						format: {self name . Parser new parseSelector: aString})].
	query := '({1}) newMethodFromSqueakString: {2} inEnv: {3} classified: {4}' format: {
				self codeReferencingMe.
				aString storeString.
				envId.
				aSymbol asSymbol storeString}.
	self repository executeString: query