initialize-release
setSelector: aSymbol

	| newCategory |
	self invalidateMessageCategoryDict.
	self messageCategoryDict keysAndValuesDo: [:category :selectors |
		(selectors includes: aSymbol) ifTrue: [newCategory := category]].
	self selectMessageCategoryNamed: newCategory.
	newCategory ifNotNil: [self selectMessageNamed: aSymbol]