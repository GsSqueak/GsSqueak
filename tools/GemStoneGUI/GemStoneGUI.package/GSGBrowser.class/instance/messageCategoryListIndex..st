message category list
messageCategoryListIndex: anInteger

	self selectMessageCategoryNamed: (self messageCategoryList at: anInteger ifAbsent: [nil])