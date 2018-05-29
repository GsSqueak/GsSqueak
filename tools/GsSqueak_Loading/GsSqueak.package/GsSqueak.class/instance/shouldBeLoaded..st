testing
shouldBeLoaded: aClassOrClassDefinition

	| name category |
	name := aClassOrClassDefinition name asString.
	category := aClassOrClassDefinition category asString.
	(self classesNotToLoad includes: name) ifTrue: [^ false].
	(self categoriesNotToLoad anySatisfy: [:prefix |
		self category: category matches: prefix]) ifTrue: [^ false].
	(self classesToLoad includes: name) ifTrue: [^ true].
	(self categoriesToLoad anySatisfy: [:prefix |
		self category: category matches: prefix]) ifTrue: [^ true].
	^ false