accessing
categories
	"Answer an Array of categories (names)."
	| categoryArray |
	categoryArray := self categoryArray.
	categoryArray isNil ifTrue: [^ nil].
	(categoryArray size = 1 
		and: [categoryArray first = Default & (self allElements isEmpty)])
			ifTrue: [^ Array with: NullCategory].
	^ categoryArray