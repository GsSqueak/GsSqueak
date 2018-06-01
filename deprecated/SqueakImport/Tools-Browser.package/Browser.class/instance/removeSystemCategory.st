system category functions
removeSystemCategory
	"If a class category is selected, create a Confirmer so the user can 
	verify that the currently selected class category and all of its classes
 	should be removed from the system. If so, remove it."

	self hasSystemCategorySelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	(self classList size = 0
		or: [self confirm: 'Are you sure you want to
remove this system category 
and all its classes?'])
		ifTrue: 
		[| nextSelectedCat |
		nextSelectedCat := self systemCategoryList before: self selectedSystemCategory ifAbsent: [nil].
		systemOrganizer removeSystemCategory: self selectedSystemCategory.
		self selectSystemCategory: nextSelectedCat.
		self changed: #systemCategoryList]