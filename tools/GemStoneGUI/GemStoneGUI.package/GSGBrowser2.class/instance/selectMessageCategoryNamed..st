message category list
selectMessageCategoryNamed: aSymbol 

	selectedMessageCategoryName := (self messageCategoryList includes: aSymbol)
		ifTrue: [aSymbol]
		ifFalse: [nil].
	self invalidateMessageList.
	self changed: #messageCategoryListIndex