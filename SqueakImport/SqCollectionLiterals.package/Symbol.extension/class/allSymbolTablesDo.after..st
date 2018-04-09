*SqCollectionLiterals-class initialization
allSymbolTablesDo: aBlock after: aSymbol

	| originalNewSymbols originalSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	(originalNewSymbols includes: aSymbol) 
		ifTrue: [
			originalNewSymbols do: aBlock after: aSymbol.
			originalSymbolTable do: aBlock after: aSymbol ]
		ifFalse: [
			originalSymbolTable do: aBlock after: aSymbol.
			originalNewSymbols do: aBlock after: aSymbol ]
	
