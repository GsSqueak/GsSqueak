message category functions
printOutMessageCategories
	"Print a description of the selected message category of the selected class 
	onto an external file in Html format."

Cursor write showWhile:
	[self hasMessageCategorySelected
		ifTrue: 
			[self selectedClassOrMetaClass fileOutCategory: self selectedMessageCategoryName
										asHtml: true]]