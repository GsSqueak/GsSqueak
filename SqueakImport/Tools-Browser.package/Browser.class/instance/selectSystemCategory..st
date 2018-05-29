system category list
selectSystemCategory: aSymbol
	"Set the selected system category. Update all other selections to be deselected."
	aSymbol = selectedSystemCategory ifTrue: [^ self].
	selectedSystemCategory := aSymbol.
	selectedClassName := nil.
	selectedMessageCategoryName := nil.
	selectedMessageName := nil.
	self editSelection: ( aSymbol isNil ifTrue: [#none] ifFalse: [#newClass]).
	metaClassIndicated := false.
	self setClassOrganizer.
	contents := nil.
	self changed: #systemCategorySelectionChanged.
	self changed: #systemCategoryListIndex.	"update my selection"
	self changed: #classList.
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel.
	self contentsChanged