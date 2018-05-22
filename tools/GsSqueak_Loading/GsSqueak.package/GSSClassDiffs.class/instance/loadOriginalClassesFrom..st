loading
loadOriginalClassesFrom: aFileDirectory

	| categoriesToLoad classesToLoad |
	categoriesToLoad := self loadCategoriesToLoadFrom: aFileDirectory.
	classesToLoad := (categoriesToLoad gather: [:category |
		(SystemOrganization listAtCategoryNamed: category)]) asSet.
	classesToLoad addAll: (self loadClassesToLoadFrom: aFileDirectory).
	classesToLoad removeAll: (self loadClassesNotToLoadFrom: aFileDirectory).
	classesToLoad do: [:className | self loadOriginalClassNamed: className]