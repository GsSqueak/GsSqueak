helpers
categoryDictFor: class classSide: isClassSide env: envId

	| tpzResult |
	self setClass: class.
	self setEnv: envId.
	tpzResult := isClassSide
					ifTrue: [self listClassCategories]
					ifFalse: [self listInstanceCategories].
	^ self convertToCategoryDict: (tpzResult at: 1)