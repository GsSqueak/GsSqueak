message category dict
currentMessageCategoryDict

	^ self hasClassSelected
		ifFalse: [Dictionary new]
		ifTrue: [self selectedClassOrMetaClass messageCategoryDict]