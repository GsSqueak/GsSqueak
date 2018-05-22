accessing
leastRecent
	^ methodReferences
		ifEmpty: [ nil ]
		ifNotEmpty: [ methodReferences last ]