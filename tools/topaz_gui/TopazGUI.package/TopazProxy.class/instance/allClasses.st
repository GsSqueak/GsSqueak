api
allClasses

	| topazOutput |
	topazOutput := self listClasses.
	^ self convertToSymbolList: (topazOutput at: 1)