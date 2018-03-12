message category list
selectMessageCategoryNamed: aSymbol 
	
	selectedMessageCategoryName := aSymbol.
	selectedMessageName := nil.
	self changed: #messageCategoryListIndex. "update my selection"
	self changed: #messageList