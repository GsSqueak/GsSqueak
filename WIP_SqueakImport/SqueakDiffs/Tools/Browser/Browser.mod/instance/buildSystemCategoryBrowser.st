system category functions
buildSystemCategoryBrowser
	"Open a new system category browser on the selelcted category, if there is one"

	self hasSystemCategorySelected
		ifTrue: 
			[self class newOnCategory: self selectedSystemCategory]