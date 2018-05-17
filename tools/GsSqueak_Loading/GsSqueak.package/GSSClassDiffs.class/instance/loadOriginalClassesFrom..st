loading
loadOriginalClassesFrom: aFileDirectory

	| categoriesToLoad categoryFile |
	categoryFile := aFileDirectory entryAt: 'categoriesToLoad' ifAbsent: [^ self].
	categoriesToLoad := self loadCategoriesToLoadFrom: categoryFile.
	categoriesToLoad do: [:category |
		(SystemOrganization listAtCategoryNamed: category) do: [:className |
			self loadOriginalClassNamed: className]]