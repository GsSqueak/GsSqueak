api
categoriesFor: class classSide: isClassSide env: envId

	| categoryDict |
	categoryDict := self 
						categoryDictFor: class
						classSide: isClassSide
						env: envId.
	^ categoryDict keys