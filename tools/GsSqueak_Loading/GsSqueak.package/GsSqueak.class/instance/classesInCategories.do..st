loading
classesInCategories: categoryArray do: aBlock

	categoryArray do: [:category |
		(SystemOrganization listAtCategoryNamed: category) do: [:className |
			aBlock value: (self environment at: className)]]