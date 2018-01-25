private
logSelectorsInChangedCategory: newCategory
	"make an entry in the changes file for each method in the changed category"
	(self listAtCategoryNamed: newCategory) do: [:element |
		self logChangedSelector: element category: newCategory].
