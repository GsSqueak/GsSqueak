remove
categoriesMatching: matchString
	"Return all matching categories"
	^ self categories select: [:c | matchString match: c]