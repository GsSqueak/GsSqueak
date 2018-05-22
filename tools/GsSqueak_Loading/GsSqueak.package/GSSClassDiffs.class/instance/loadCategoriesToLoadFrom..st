loading - specifications
loadCategoriesToLoadFrom: aFileDirectory

	| categoriesToLoad categoryFile |
	categoryFile := aFileDirectory entryAt: 'categoriesToLoad' ifAbsent: [^ Array new].
	categoriesToLoad := categoryFile readStream contents lines.
	^ SystemOrganization categories select: [:category |
		categoriesToLoad anySatisfy: [:categoryToLoad |
			category = categoryToLoad
			or: [(category findString: categoryToLoad , $- startingAt: 1) = 1]]]