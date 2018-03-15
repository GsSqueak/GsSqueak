api
classesInSystemCategory: systemCategory

	| topazOutput |
	topazOutput := self listClassesInSystemCategory: systemCategory.
	^ self convertToSymbolList: (topazOutput at: 1)