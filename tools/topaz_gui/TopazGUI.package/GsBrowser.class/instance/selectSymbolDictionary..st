symbol dictionary list
selectSymbolDictionary: aSymbol
	"Set the selected symbol dictionary. Update all other selections to be deselected."
	
	selectedSymbolDictionary := aSymbol.
	selectedSystemCategory := nil.
	selectedClassName := nil.
	selectedMessageCategoryName := nil.
	selectedMessageName := nil.
	self changed: #symbolDictionaryListIndex. "update my selection"
	self changed: #systemCategoryList.
	self changed: #classList.
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel