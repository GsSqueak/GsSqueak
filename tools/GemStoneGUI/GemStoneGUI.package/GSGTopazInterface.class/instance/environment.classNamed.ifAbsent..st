new api - environments
environment: environmentProxy classNamed: aSymbol ifAbsent: absenceBlock

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForResolving: aSymbol 
										inSymbolList: environmentProxy) , 
									' ifNotNil: [:result | ' , 
										(self codeForConvertingToOop: 'result') , $].
	^ (topazOutput at: 1) = 'nil'
		ifTrue: [absenceBlock value]
		ifFalse: [self classProxyNamed: aSymbol inEnvironment: environmentProxy]