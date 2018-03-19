new api - environments
environment: environmentProxy hierarchyTreeOfClassNames: classes env: envId

	| topazOutput code |
	code := (self codeForPrintingListCreatedBy: 
				(self codeForHierarchicallySortingClassListCreatedBy: 
					(self codeForCreatingArrayWith: classes) , 
					' collect: [:className | ' ,
						environmentProxy codeReferencingMe , 
							' objectNamed: className]'
					env: envId)).
	self setEnv: 0.
	topazOutput := self run: code.
	^ self convertToHierarchyTree: (topazOutput at: 1)