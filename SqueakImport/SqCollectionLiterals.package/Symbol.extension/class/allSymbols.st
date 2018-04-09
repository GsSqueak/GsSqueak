*SqCollectionLiterals-access
allSymbols
	"Answer all interned symbols"
	
	| originalNewSymbols originalSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	^Array
		new: originalNewSymbols slowSize + originalSymbolTable slowSize
		streamContents:[ :stream |
			stream
				nextPutAll: originalNewSymbols;
				nextPutAll: originalSymbolTable ]
