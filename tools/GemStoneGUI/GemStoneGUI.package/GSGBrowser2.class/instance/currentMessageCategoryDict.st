message category dict
currentMessageCategoryDict

	^ self hasClassSelected
		ifFalse: [Dictionary new]
		ifTrue: [self selectedClassOrMetaClass messageCategoryDictForEnv: self envId]