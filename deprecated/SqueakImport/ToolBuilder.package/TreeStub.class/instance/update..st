events
update: anObject
	anObject == spec roots ifTrue: [^ self updateRoots].
	anObject == spec getSelectedPath ifTrue: [^ self updateSelectedPath].
	(anObject isKindOf: Array) ifTrue: [^ self openPath: anObject allButFirst].
	super update: anObject
	