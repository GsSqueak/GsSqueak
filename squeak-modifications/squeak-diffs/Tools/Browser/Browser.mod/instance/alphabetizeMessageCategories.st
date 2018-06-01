message category functions
alphabetizeMessageCategories
	| oldMessageCategory oldMethod |
	oldMessageCategory := selectedMessageCategoryName.
	oldMethod := selectedMessageName.
	self hasClassSelected ifFalse: [^ false].
	self okToChange ifFalse: [^ false].
	self classOrMetaClassOrganizer sortCategories.
	self clearUserEditFlag.
	self editClass.
	self selectClassNamed: selectedClassName.
	self selectMessageCategoryNamed: oldMessageCategory.
	self selectMessageNamed: oldMethod.
	^ true