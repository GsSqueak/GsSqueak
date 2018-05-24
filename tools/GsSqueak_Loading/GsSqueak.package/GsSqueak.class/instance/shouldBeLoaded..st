testing
shouldBeLoaded: aClassOrClassDefinition

	| name category |
	name := aClassOrClassDefinition name asString.
	category := aClassOrClassDefinition category asString.
	(self classesNotToLoad includes: name) ifTrue: [^ false].
	(self categoriesNotToLoad anySatisfy: [:categoryOrPackage |
		self category: categoryOrPackage matches: category]) ifTrue: [^ false].
	(self classesToLoad includes: name) ifTrue: [^ true].
	(self categoriesToLoad anySatisfy: [:categoryOrPackage |
		self category: categoryOrPackage matches: category]) ifTrue: [^ true].
	^ false