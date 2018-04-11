new api - environments
environment: environmentProxy classNamed: aSymbol ifAbsent: absenceBlock

	| topazOutput |
	topazOutput := self run: (self codeForResolving: aSymbol 
										inSymbolList: environmentProxy) , 
									' ifNotNil: [:result | ' , 
										(self codeForConvertingToOop: 'result') , $].
	^ topazOutput first = 'nil'
		ifTrue: [absenceBlock value]
		ifFalse: [self classProxyNamed: aSymbol inEnvironment: environmentProxy]