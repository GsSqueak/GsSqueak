*SqCollectionLiterals-class initialization
compactSymbolTable
	"Reduce the size of the symbol table so that it holds all existing symbols with 25% free space."

	self deprecated: 'Use #condenseNewSymbols instead'.
	self condenseNewSymbols
