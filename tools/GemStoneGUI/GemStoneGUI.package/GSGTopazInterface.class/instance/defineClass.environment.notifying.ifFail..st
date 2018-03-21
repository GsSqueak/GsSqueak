new api
defineClass: aString environment: environmentProxy notifying: aController ifFail: aBlock

	| query topazOutput |
	query := '((', aString codeReferencingMe, ' 
				_compileInContext: nil 
				symbolList: ', environmentProxy codeReferencingMe, 
				' oldLitVars: nil 
				environmentId: 0 
				flags: 0) _executeInContext: nil) name'.
	
	topazOutput := self run: query.
	^ topazOutput second
		ifNotEmpty: aBlock 
		ifEmpty: [self classProxyNamed: topazOutput first inEnvironment: environmentProxy]
	