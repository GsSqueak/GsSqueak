initialize-release
setSelector: aSymbol

	| newCategory |
	self invalidateMessageCategoryDict.
	self messageCategoryDict keysAndValuesDo: [:category :selectors |
		(selectors includes: aSymbol) ifTrue: [newCategory := category]].
	newCategory ifNil: [self error: 'No such selector'].
	self selectMessageCategoryNamed: newCategory.
	self selectMessageNamed: aSymbol