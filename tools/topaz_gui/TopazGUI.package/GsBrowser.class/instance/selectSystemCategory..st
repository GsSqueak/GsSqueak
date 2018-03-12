system category list
selectSystemCategory: aSymbol
	"Set the selected system category. Update all other selections to be deselected."
	
	selectedSystemCategory := aSymbol.
	selectedClassName := nil.
	selectedMessageCategoryName := nil.
	selectedMessageName := nil.
	self changed: #systemCategoryListIndex.	"update my selection"
	self changed: #classList.
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel