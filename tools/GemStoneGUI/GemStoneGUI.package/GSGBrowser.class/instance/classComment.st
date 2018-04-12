class content
classComment

	^ self hasClassSelected
		ifTrue: [self selectedClass comment]
		ifFalse: ['']