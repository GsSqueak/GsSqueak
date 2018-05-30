message category list
messageCategoryList
	"Answer the selected category of messages."

	^ self hasClassSelected
		ifFalse: [Array new]
		ifTrue: [ {ClassOrganizer allCategory},
			(self class sortMessageCategoriesAlphabetically
				ifTrue: [self rawMessageCategoryList sorted]
				ifFalse: [self rawMessageCategoryList]) ]