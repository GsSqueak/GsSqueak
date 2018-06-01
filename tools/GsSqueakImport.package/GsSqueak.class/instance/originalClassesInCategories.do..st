loading - original classes
originalClassesInCategories: categoryArray do: aBlock

	categoryArray do: [:category |
		(SystemOrganization listAtCategoryNamed: category) do: [:className |
			aBlock value: (self originalClassNamed: className)]]