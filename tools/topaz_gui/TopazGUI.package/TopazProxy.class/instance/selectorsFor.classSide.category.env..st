api
selectorsFor: class classSide: isClassSide category: category env: envId

	| categoryDict |
	category ifNil: [^ self 
						allSelectorsFor: class
						classSide: isClassSide
						env: envId].
	
	categoryDict := self 
						categoryDictFor: class
						classSide: isClassSide
						env: envId.
	^ categoryDict at: category asSymbol ifAbsent: [Array new]