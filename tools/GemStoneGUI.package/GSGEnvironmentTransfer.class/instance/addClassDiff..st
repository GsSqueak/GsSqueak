diffing
addClassDiff: aDiff

	aDiff isCreation ifTrue: [self classCreations add: aDiff].
	aDiff isRemoval ifTrue: [self classRemovals add: aDiff].
	aDiff isModification ifTrue: [self classModifications add: aDiff]