api
allSystemCategories

	| topazOutput |
	topazOutput := self listSystemCategories.
	^ self convertToSymbolList: (topazOutput at: 1)