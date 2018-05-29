events
update: aSelector
	aSelector = spec list ifTrue: [^ self refreshList].
	aSelector = spec getSelected ifTrue: [^ self refreshIndex].
	aSelector = spec getIndex ifTrue: [^ self refreshIndex].
	^ super update: aSelector