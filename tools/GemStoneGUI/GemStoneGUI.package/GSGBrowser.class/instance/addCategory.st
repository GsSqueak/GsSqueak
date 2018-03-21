message category functions
addCategory
	"Present a choice of categories or prompt for a new category name and add it before the current selection, or at the end if no current selection"
	| newName oldCategory |
	self okToChange ifFalse: [^ self].
	self hasClassSelected ifFalse: [^ self].
	newName := UIManager default request: 'Add Category'.
	newName
		ifEmpty: [^ self]
		ifNotEmpty: [newName := newName asSymbol].
	oldCategory := self selectedMessageCategoryName.
	self classOrMetaClassOrganizer
		addCategory: newName
		before: (self hasMessageCategorySelected
				ifFalse: [nil]
				ifTrue: [self selectedMessageCategoryName]).
	self changed: #messageCategoryList.
	self selectMessageCategoryNamed: newName.
	self changed: #messageCategoryList.
