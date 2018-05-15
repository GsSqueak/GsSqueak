initialization
loadSqueakClassesFrom: aFileDirectory

	| categories categoriesToLoad categoryFile |
	categoryFile := aFileDirectory entryAt: 'categoriesToLoad' ifAbsent: [^ self].
	categoriesToLoad := categoryFile readStream contents lines.
	
	categories := SystemOrganization categories.
	categories select: [:category |
		categoriesToLoad anySatisfy: [:categoryToLoad |
			category = categoryToLoad
			or: [(category findString: categoryToLoad , $- startingAt: 1) = 1]]]