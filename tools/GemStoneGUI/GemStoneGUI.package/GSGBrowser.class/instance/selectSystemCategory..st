system category list
selectSystemCategory: aSymbol
	"Set the selected system category. Update all other selections to be deselected."
	aSymbol = selectedSystemCategoryName ifTrue: [^ self].
	selectedSystemCategoryName := aSymbol.
	self hasSystemCategorySelected 
		ifTrue: [self editSelection: #newClass]
		ifFalse: [self editSelection: #none].
	self invalidateClassList.
	self changed: #systemCategoryListIndex