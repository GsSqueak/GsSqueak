new api - environments
environment: environmentProxy at: aSymbol put: objectProxy

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForResolving: #UserGlobals 
									inSymbolList: environmentProxy) ,
									' at: #''' , aSymbol ,
									''' put: ' , objectProxy codeReferencingMe.
	^ objectProxy