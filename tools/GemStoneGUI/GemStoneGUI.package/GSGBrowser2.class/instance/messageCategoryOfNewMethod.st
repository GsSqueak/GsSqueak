contents
messageCategoryOfNewMethod

	| category |
	self currentMethod ifNotNil: [:method | ^ method category].
	category := self selectedMessageCategoryName.
	(category isNil or: [category = self allCategory]) ifTrue: [^ self defaultCategory].
	^ category