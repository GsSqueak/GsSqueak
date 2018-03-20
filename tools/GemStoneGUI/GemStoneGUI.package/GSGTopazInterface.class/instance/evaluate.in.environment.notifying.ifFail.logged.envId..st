new api
evaluate: aString in: aContext environment: environmentProxy notifying: aController ifFail: aBlock logged: logFlag envId: envId

	| query topazOutput |
	query := '( ', aString codeReferencingMe, ' _compileInContext: ', aContext codeReferencingMe ,' symbolList: ', environmentProxy codeReferencingMe, ' oldLitVars: nil  enviromentId: ', envId, ' flags: nil) _executeInContext: nil'.
	
	topazOutput := self run: query.
	^ self classProxyNamed: topazOutput first inEnvironment: environmentProxy
	