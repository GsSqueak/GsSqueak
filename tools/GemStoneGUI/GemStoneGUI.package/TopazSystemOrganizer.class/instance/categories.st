accessing
categories
	"Answer an Array of categories (names)."
	| categoryArray |
	categoryArray := self categoryArray.
	categoryArray isNil ifTrue: [^ nil].
	(categoryArray size = 1 
		and: [categoryArray first = ClassOrganizer default & (self allElements isEmpty)])
			ifTrue: [^ Array with: ClassOrganizer nullCategory].
	^ categoryArray