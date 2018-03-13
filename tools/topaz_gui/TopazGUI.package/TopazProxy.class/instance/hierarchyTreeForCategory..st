api
hierarchyTreeForCategory: categoryName

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: (self codeForHierarchicallySortingClassListCreatedBy: (self codeForGettingAllClassesInCategory: categoryName))).
	^ self convertToHierarchyTree: (topazOutput at: 1)