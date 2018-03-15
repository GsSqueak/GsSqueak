accessing
listAtCategoryNamed: categoryName
	"Answer the array of elements associated with the name, categoryName."

	^ (self topazProxy classesInSystemCategory: categoryName) sorted