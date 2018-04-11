message category list
addMessageCategory
	"Present a choice of categories or prompt for a new category name and add it before the current selection, or at the end if no current selection"
	| newName |
	self okayToChange ifFalse: [^ self].
	self hasClassSelected ifFalse: [^ self].
	newName := UIManager default request: 'Add Category'.
	newName ifEmpty: [^ self].
	newName := newName asSymbol.
	self selectedClassOrMetaClass
		addCategory: newName
		environmentId: self environmentId.
	self invalidateMessageCategoryDict.
	self selectMessageCategoryNamed: newName
