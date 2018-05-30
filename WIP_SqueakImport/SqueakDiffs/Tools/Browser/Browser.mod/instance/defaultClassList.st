class list
defaultClassList
	"Answer an array of the class names of the selected category. Answer an 
	empty array if no selection exists."
		
	^ self hasSystemCategorySelected
		ifFalse: [Array new]
		ifTrue: [self selectedSystemCategory = SystemOrganizer allCategory
			ifTrue: [systemOrganizer allElements sort]
			ifFalse: [systemOrganizer listAtCategoryNamed: self selectedSystemCategory]]
