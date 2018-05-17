helper
convertToSymbolArrayString: anArray

	^ (anArray asArray collect: [:each |
		each asSymbol]) printString