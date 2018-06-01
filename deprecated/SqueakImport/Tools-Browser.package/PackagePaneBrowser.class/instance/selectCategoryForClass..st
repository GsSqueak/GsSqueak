system category list
selectCategoryForClass: theClass
	"Set the package and category lists to display the given class."

	| cat catName |
	cat := theClass category.
	self packageListIndex: (self packageList indexOf: (cat copyUpTo: $-)).
	catName := (cat copyFrom: ((cat indexOf: $-) + 1) to: cat size).
	self selectSystemCategory: catName.