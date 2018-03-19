new api - environments
environment: environmentProxy at: aSymbol ifAbsent: absenceBlock

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForResolving: aSymbol 
										inSymbolList: environmentProxy) , 
									' ifNotNil: [:result | ' , 
										(self codeForConvertingToOop: 'result') , $].
	^ (topazOutput at: 1) = 'nil'
		ifTrue: [absenceBlock value]
		ifFalse: [
			| objectOop |
			objectOop := self convertToInteger: (topazOutput at: 1).
			self flag: #gsg.
			GSGClassProxy interface: self named: aSymbol inEnvironment: environmentProxy]