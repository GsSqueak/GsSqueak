loading
loadCategoriesToLoadFrom: aFileDirectoryEntry

	| categoriesToLoad |
	categoriesToLoad := aFileDirectoryEntry readStream contents lines.
	^ SystemOrganization categories select: [:category |
		categoriesToLoad anySatisfy: [:categoryToLoad |
			category = categoryToLoad
			or: [(category findString: categoryToLoad , $- startingAt: 1) = 1]]]