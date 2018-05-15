concretization
concreteClassForExtension: aString

	self subclassesDo: [:aClass |
		(aClass handlesExtension: aString) ifTrue: [^ aClass]].
	self error: 'No class to handle that extension'