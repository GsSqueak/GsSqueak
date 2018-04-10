class content
classHierarchy

	^ self hasClassSelected
		ifTrue: [self selectedClass printHierarchyForEnvironmentId: self envId]
		ifFalse: ['']