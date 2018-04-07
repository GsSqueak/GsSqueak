class content
classHierarchy

	^ self hasClassSelected
		ifTrue: [self selectedClass hierarchy]
		ifFalse: ['']