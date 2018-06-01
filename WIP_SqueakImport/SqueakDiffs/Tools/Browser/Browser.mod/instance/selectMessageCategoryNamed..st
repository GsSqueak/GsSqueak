message category list
selectMessageCategoryNamed: aSymbol 
	"Given aSymbol, select the category with that name.  Do nothing if 
	aSymbol doesn't exist."
	selectedMessageCategoryName := aSymbol.
	
	selectedMessageName := nil.
	self changed: #messageCategorySelectionChanged.
	self changed: #messageCategoryListIndex. "update my selection"
	self changed: #messageList.
	self editSelection: (aSymbol notNil
		ifTrue: [#newMessage]
		ifFalse: [self hasClassSelected
			ifTrue: [#editClass]
			ifFalse: [#newClass]]).
	contents := nil.
	self contentsChanged.