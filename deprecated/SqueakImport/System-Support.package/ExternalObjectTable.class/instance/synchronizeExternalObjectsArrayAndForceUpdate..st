private
synchronizeExternalObjectsArrayAndForceUpdate: forceUpdate

	| actualExternalObjectsArray |
	actualExternalObjectsArray := Smalltalk specialObjectsArray at: 39.
	(actualExternalObjectsArray == externalObjectsArray and: [ forceUpdate not ])
		ifTrue: [ ^self ].
	self externalObjectsArray: actualExternalObjectsArray