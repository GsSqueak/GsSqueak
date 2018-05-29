system category functions
addSystemCategory
	"Prompt for a new category name and add it before the
	current selection, or at the end if no current selection"
	| oldSelection newName |
	self okToChange ifFalse: [^ self].
	oldSelection := self selectedSystemCategory.
	newName := self
		request: 'Please type new category name'
		initialAnswer: 'Category-Name'.
	newName isEmpty
		ifTrue: [^ self]
		ifFalse: [newName := newName asSymbol].
	systemOrganizer
		addCategory: newName
		before: self selectedSystemCategory.
	self selectSystemCategory:
		(oldSelection isNil
			ifTrue: [ self systemCategoryList last ]
			ifFalse: [ oldSelection ]).
	self changed: #systemCategoryList.