class content
classHierarchy

	^ self hasClassSelected
		ifTrue: [self selectedClass printHierarchy]
		ifFalse: ['']