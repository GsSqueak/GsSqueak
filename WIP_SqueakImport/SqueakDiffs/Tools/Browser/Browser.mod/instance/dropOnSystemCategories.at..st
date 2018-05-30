drag and drop
dropOnSystemCategories: aClass at: index
	| category |
	(aClass isBehavior) ifFalse:[^self inform: 'Can only drop classes'].
	category := self systemCategoryList at: index.
	self selectedEnvironment organization classify: aClass instanceSide name  under: category.
	^true