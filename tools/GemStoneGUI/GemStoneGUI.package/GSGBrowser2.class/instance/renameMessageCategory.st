message category list
renameMessageCategory
	"Prompt for a new category name and add it before the
	current selection, or at the end if no current selection"
	| oldName newName selector |
	self hasClassSelected ifFalse: [^ self].
	self okayToChange ifFalse: [^ self].
	self hasMessageCategorySelected ifFalse: [^ self].		
	oldName := self selectedMessageCategoryName.
	newName := UIManager default
					request: 'Please type new category name'
					initialAnswer: oldName.
	newName ifEmpty: [^ self].
	newName := newName asSymbol.
	newName = oldName ifTrue: [^ self].
	self selectedClassOrMetaClass
		renameCategory: oldName
		to: newName
		environmentId: self environmentId.
	selector := self selectedMessageName.
	self invalidateMessageCategoryDict.
	self selectMessageCategoryNamed: newName