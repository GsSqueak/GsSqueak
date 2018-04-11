interface
hierarchyTreeOfClassNames: classNames environmentId: envId

	| topazOutput code |
	code := (self codeForPrintingListCreatedBy: 
				(self codeForHierarchicallySortingClassListCreatedBy: 
					(self codeForCreatingArrayWith: classNames) ,
					' collect: [:className | ' ,
						self codeReferencingMe , ' classNamed: className]'
					environmentId: envId)).
	topazOutput := self session run: code.
	^ self convertToHierarchyTree: topazOutput first environment: self