accessing
listAtCategoryNamed: categoryName
	"Answer the array of elements associated with the name, categoryName."

	^ (self topazProxy selectorsFor: self subject category: categoryName env: self env) sorted