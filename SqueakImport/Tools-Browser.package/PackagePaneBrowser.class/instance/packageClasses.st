class list
packageClasses
	^ self categoryExistsForPackage
		ifFalse: [Array new]
		ifTrue:
			[systemOrganizer listAtCategoryNumber:
				(systemOrganizer categories indexOf: self package asSymbol)]