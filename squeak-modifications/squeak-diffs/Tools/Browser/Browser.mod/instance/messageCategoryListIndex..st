message category list
messageCategoryListIndex: anInteger
	"Set the selected message category to be the one indexed by anInteger."

	selectedMessageCategoryName := nil.
	self selectMessageCategoryNamed: (self messageCategoryList at: anInteger ifAbsent: [nil]).