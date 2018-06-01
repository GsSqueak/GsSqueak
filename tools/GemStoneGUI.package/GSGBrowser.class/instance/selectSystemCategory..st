system category list
selectSystemCategory: aSymbol

	selectedSystemCategoryName := aSymbol.
	self hasSystemCategorySelected 
		ifTrue: [self editSelection: #newClass]
		ifFalse: [self editSelection: #none].
	self invalidateClassList.
	self changed: #systemCategoryListIndex