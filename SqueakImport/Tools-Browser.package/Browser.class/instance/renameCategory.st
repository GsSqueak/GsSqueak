message category functions
renameCategory
	"Prompt for a new category name and add it before the
	current selection, or at the end if no current selection"
	| oldName newName |
	self hasClassSelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	self hasMessageCategorySelected ifFalse: [^ self].
		
	oldName := self selectedMessageCategoryName.
	newName := self
		request: 'Please type new category name'
		initialAnswer: oldName.
	newName isEmpty
		ifTrue: [^ self]
		ifFalse: [newName := newName asSymbol].
	newName = oldName ifTrue: [^ self].
	self classOrMetaClassOrganizer
		renameCategory: oldName
		toBe: newName.
	self selectClassNamed: selectedClassName.
	self selectMessageCategoryNamed: newName.
	self changed: #messageCategoryList.
