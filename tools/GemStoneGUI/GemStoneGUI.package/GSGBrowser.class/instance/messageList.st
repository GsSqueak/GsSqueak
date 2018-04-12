message list
messageList
	"Answer an Array of the message selectors of the currently selected message category."
	| category |
	category := self selectedMessageCategoryName.
	self hasClassSelected ifFalse: [^ #()].
	^ (category = self allCategory or: [self hasMessageCategorySelected not])
		ifTrue: [self allMessageNames]
		ifFalse: [self messageNamesIn: category]