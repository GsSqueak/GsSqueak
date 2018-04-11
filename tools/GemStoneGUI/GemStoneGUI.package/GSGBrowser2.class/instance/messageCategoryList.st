message category list
messageCategoryList

	^ self hasClassSelected
		ifTrue: [{self allCategory} , self messageCategoryDict keys sorted]
		ifFalse: [#()]