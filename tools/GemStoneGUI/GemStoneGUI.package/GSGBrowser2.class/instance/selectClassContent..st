class content
selectClassContent: aSymbol

	selectedClassContent := aSymbol.
	currentMethod := nil.
	self selectMessageCategoryNamed: nil.
	self classContentChanged