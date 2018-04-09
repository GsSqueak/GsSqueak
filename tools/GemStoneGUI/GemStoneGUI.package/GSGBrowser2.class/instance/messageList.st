message list
messageList
	"Answer an Array of the message selectors of the currently selected message category."
	| category categoryDict |
	category := self selectedMessageCategoryName.
	self hasClassSelected ifFalse: [^ #()].
	categoryDict := self messageCategoryDict.
	^ (category = self allCategory or: [self hasMessageCategorySelected not])
		ifTrue: [categoryDict values flatten sort]
		ifFalse: [categoryDict at: category ifAbsent: [self notify: 'Message category is missing. This should not have happened.'. #()]]