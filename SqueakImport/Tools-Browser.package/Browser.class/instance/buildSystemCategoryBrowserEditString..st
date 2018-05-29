system category functions
buildSystemCategoryBrowserEditString: aString 
	"Open a new system category browser on the selelcted category, if
	there is one"
	self hasSystemCategorySelected
		ifTrue: [self class
				newOnCategory: self selectedSystemCategory
				editString: aString
				label: 'Classes in category ' , self selectedSystemCategory]