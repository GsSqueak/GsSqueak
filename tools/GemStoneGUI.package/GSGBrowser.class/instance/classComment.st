class content
classComment

	^ self hasClassSelected
		ifTrue: [self selectedClass commentString]
		ifFalse: ['']