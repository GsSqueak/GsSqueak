new api - environments
environment: environmentProxy at: aSymbol ifAbsent: absenceBlock

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForConvertingToOop: 
									(self codeForResolving: aSymbol 
										inSymbolList: environmentProxy)).
	^ (topazOutput at: 1) = 'nil' 
		ifTrue: [absenceBlock value]
		ifFalse: [
			| objectOop |
			objectOop := self convertToInteger: (topazOutput at: 1).
			self objectProxyForOop: objectOop]