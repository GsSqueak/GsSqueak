utility
removeExtensionsFromMethodCategories: methods

	methods do: [:method |
		| category |
		category := method category.
		(self baseCategoryFor: category)
			ifEmpty: [Transcript showln: ('# {1} | {2} >> {3}'
											format: {category . self name . method selector})]
			ifNotEmpty: [:baseCategory |
				| extensionCategory |
				extensionCategory := self extensionCategoryFor: category.
				(extensionCategory notEmpty and: [(GsSqueak new categoriesMatching: extensionCategory allButFirst) notEmpty])
					ifTrue: [Transcript showln: ('{1} | {2} >> {3}'
											format: {category . self name . method selector})]
					ifFalse: [method category: baseCategory]]]