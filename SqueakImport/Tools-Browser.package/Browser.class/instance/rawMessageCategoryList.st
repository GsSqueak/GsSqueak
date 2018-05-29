message category list
rawMessageCategoryList
	^ self hasClassSelected
		ifTrue: [self classOrMetaClassOrganizer categories]
		ifFalse: [Array new]