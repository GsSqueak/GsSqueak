concretization
concreteClassForExtension: aString

	self allSubclassesDo: [:aClass |
		(aClass handlesExtension: aString) ifTrue: [^ aClass]].
	self error: 'No class to handle that extension'