api
hierarchyTreeForCategory: categoryName env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: (self codeForPrintingListCreatedBy: (self codeForHierarchicallySortingClassListCreatedBy: (self codeForGettingAllClassesInCategory: categoryName) env: envId)).
	^ self convertToHierarchyTree: (topazOutput at: 1)