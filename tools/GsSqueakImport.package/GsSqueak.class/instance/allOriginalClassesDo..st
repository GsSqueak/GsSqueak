loading - original classes
allOriginalClassesDo: aBlock

	| classesToLoad categoriesToLoad |
	"categoriesToLoad := self categoriesToLoad collect: [:string | string asSymbol] as: Set."
	categoriesToLoad := self categoriesToLoad gather: [:category |
							self categoriesMatching: category].
	classesToLoad := self classesToLoad
							collect: [:className | self originalClassNamed: className]
							thenSelect: [:class | class notNil].
	classesToLoad := classesToLoad asSet.
	self originalClassesInCategories: categoriesToLoad do: [:classDefinition |
		classesToLoad remove: classDefinition ifAbsent: [].
		aBlock value: classDefinition].
	classesToLoad do: [:class | aBlock value: class]