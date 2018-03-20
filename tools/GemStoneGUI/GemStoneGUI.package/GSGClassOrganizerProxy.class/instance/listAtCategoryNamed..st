accessing
listAtCategoryNamed: categoryName
	"Answer the array of elements associated with the name, categoryName."

	^ self interface class: self subject selectorsInMessageCategory: categoryName env: self envId