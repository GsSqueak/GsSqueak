api
classesInSymbolDictionary: symbolDictionary

	| topazOutput |
	topazOutput := self listClassesInSymbolDictionary: symbolDictionary.
	^ self convertToSymbolList: (topazOutput at: 1)