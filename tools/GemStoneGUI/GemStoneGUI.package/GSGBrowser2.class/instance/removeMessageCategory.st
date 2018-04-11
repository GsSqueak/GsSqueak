message category list
removeMessageCategory
	"If a message category is selected, create a Confirmer so the user can 
	verify that the currently selected message category should be removed
 	from the system. If so, remove it."
	| messageCategoryName |
	self hasMessageCategorySelected ifFalse: [^ self].
	self okayToChange ifFalse: [^ self].
	messageCategoryName := self selectedMessageCategoryName.
	(self messageList isEmpty
		or: [self confirm: 'Are you sure you want to
remove this method category 
and all its methods?']) ifFalse: [^ self].
	self selectedClassOrMetaClass 
			removeCategory: messageCategoryName
			environmentId: self environmentId.
	self invalidateMessageCategoryDict
