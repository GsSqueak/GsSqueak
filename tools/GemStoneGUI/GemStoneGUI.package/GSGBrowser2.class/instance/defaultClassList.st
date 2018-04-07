class list
defaultClassList

	^ self hasSystemCategorySelected
		ifFalse: [#()]
		ifTrue: [self selectedSystemCategory = self allCategory
			ifTrue: [self environment classNames]
			ifFalse: [self environment classNamesInSystemCategory: self selectedSystemCategory]]