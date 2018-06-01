class list
classList
	"Answer an array of the class names of the selected category. Answer an 
	empty array if no selection exists."

	^ self hasSystemCategorySelected 
		ifFalse: [self packageClasses]
		ifTrue: [systemOrganizer listAtCategoryNamed: self selectedSystemCategory]