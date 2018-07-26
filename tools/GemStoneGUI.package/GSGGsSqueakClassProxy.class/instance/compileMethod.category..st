interface
compileMethod: aString category: aSymbol

	| query |
	aString size >  30000 ifTrue: [
		Transcript show: ('Method {1} >> {2} too long. Can''t do that with the current implementation of TopazInterface'
						format: {self name . Parser new parseSelector: aString}).
		^ self ].
	query := '({1}) newMethodFromSqueakString: {2} inEnv: {3} classified: {4}' format: {
				self codeReferencingMe.
				aString storeString.
				self environmentId.
				aSymbol asSymbol storeString}.
	self repository executeString: query