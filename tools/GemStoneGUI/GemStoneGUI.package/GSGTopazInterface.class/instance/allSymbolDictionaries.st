api
allSymbolDictionaries

	| topazOutput |
	topazOutput := self listSymbolDictionaries.
	^ self convertToSymbolList: (topazOutput at: 1)