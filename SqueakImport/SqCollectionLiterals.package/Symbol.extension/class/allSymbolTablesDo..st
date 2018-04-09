*SqCollectionLiterals-class initialization
allSymbolTablesDo: aBlock
	
	| originalNewSymbols originalSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	originalNewSymbols do: aBlock.
	originalSymbolTable do: aBlock.
