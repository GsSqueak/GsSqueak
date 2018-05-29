system category functions
printOutSystemCategory
	"Print a description of each class in the selected category as Html."

Cursor write showWhile:
	[self hasSystemCategorySelected
		ifTrue: [systemOrganizer fileOutCategory: self selectedSystemCategory
								asHtml: true ]]
