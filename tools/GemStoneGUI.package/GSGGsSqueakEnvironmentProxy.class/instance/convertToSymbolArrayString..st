class creation
convertToSymbolArrayString: anArray

	^ (anArray asArray collect: [:each |
		each asSymbol]) printString