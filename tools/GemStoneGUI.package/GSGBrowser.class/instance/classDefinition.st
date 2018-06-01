class content
classDefinition

	^ self hasClassSelected 
		ifTrue: [self selectedClass definition]
		ifFalse: ['']